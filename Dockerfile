FROM ubuntu:18.04

MAINTAINER Kevin Hein <kevin.h@kevlo.de>

# Install dependencies

RUN apt-get update && \
	apt-get -y install wget && \
	apt-get -y install libcurl3

# Create folder

RUN mkdir -p /minecraft/files

WORKDIR /minecraft/files

# Get launch script

RUN wget -q -O - https://kevlo.de/downloads/minecraft/bedrock/bedrock.sh > /minecraft/bedrock.sh && chmod +x /minecraft/bedrock.sh

# Docker stuff
VOLUME /minecraft/files

CMD [ "bash", "/minecraft/bedrock.sh"]
