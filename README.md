# Pterodactyl-Egg-Ark-Server-Tools
This tool allows you to manage any ARK: Survival Evolved linux server without having to remember long commands. It provides a lot of features, to get the full list check the Usage section please check out the developers github at https://github.com/arkmanager/ark-server-tools. This runs on Pterodactyl with my custom egg file and docker it puts the docker into a /bin/bash environment as this tool has commands that we can't be locked to the container entrypoint.sh file.

Note: You may have to run the install twice to get the ARK folder to populate it's like steamcmd gets hung after download is complete running it again will verfiy then extract.

Thank you @klightspeed for your hardwork on this tool.

Docker - rryanward/arkservertools

Environment Variables for the egg.

{{INSTALL_ARK}} - Downloads and installs (or validates an existing install) of the ARK server install

{{RUN_ARK}} - All of the following commands take arguments to specify one or more instances, with the special Select just the one 

Instance 
@main 

Select All Instance
@all

{{UPDATE_ARK}} - Updates an install of the ARK server (or installs it if it’s not already installed)
