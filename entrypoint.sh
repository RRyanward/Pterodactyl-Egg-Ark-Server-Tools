#!/bin/bash
cd /home/container

# Install Ark-Server-Tools
if [ -e "stop-install-loop.sh" ]; then
    echo 'File already exists' >&2
else
curl -sL https://raw.githubusercontent.com/arkmanager/ark-server-tools/master/netinstall.sh | bash -s container --me --perform-user-install --yes-i-really-want-to-perform-a-user-install
fi
echo "Adding install loop file" | tee stop-install-loop.sh
echo "Ark Server Tools Ready"

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ~/bin/arkmanager ${INSTALL_ARK} ${RUN_ARK} ${UPDATE_ARK} | sed -e 's/{{/${/g' -e 's/}}/}/g')`

# Run the Server
${MODIFIED_STARTUP}
/bin/bash