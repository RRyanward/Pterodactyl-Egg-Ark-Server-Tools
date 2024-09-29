#!/bin/bash
cd /home/container

# Install Ark-Server-Tools
if [ -e "stop-install-loop.sh" ]; then
    echo 'File already exists' >&2
else
curl -sL https://raw.githubusercontent.com/arkmanager/ark-server-tools/master/netinstall.sh | bash -s container --me --perform-user-install --yes-i-really-want-to-perform-a-user-install
cp /home/container/bin/arkmanager /home/container/arkmanger
fi
echo "Adding install loop file" | tee stop-install-loop.sh
echo "Ark Server Tools Ready"

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ./arkmanger ${STARTUP} --verbose | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}
/bin/bash
