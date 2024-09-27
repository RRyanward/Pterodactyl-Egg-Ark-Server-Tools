# ----------------------------------
# Ark-Server-Tools Dockerfile
# Environment: Ubuntu:24.04
# Minimum Panel Version: 0.0.0
# ----------------------------------
FROM ubuntu:24.04
LABEL maintainer="Ryan Ward <itsupport@texedo.net>"

# Install Dependencies
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y software-properties-common apt-transport-https lib32gcc-s1 perl-modules curl lsof libc6-i386 bzip2 git libstdc++5 libstdc++5:i386
RUN apt-get install -y bash coreutils findutils perl rsync sed tar

#Setup User for Docker
RUN useradd -d /home/container -m container
RUN cd /home/container
USER container
WORKDIR /home/container
ENV      HOME=/home/container

# Default command
COPY ./entrypoint.sh /entrypoint.sh
CMD  ["/bin/bash", "/entrypoint.sh"]
