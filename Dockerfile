FROM ubuntu:18.04

MAINTAINER Kevin Hein <kevin.h@kevlo.de>

# Install dependencies

RUN apt-get update && \
	apt-get -y install wget && \
	apt-get -y install libcurl3

# Create folder

RUN mkdir -p /minecraft/files

WORKDIR /minecraft

# Get launch script

RUN wget -q -O - https://kevlo.de/downloads/minecraft/bedrock/launch.sh > /minecraft/launch.sh && chmod +x /minecraft/launch.sh

# Docker stuff

EXPOSE 19132/udp
	
VOLUME /minecraft/files

CMD [ "bash", "/minecraft/launch.sh"]
