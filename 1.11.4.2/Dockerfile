FROM ubuntu:18.04

MAINTAINER Kevin Hein <kevin.h@kevlo.de>

# Install dependencies

RUN apt-get update && \
	apt-get -y install wget && \
	apt-get -y install libcurl3

# Create folders

RUN	mkdir -p /minecraft
RUN	mkdir -p /data
RUN	mkdir -p /worlds
RUN	mkdir -p /minecraft/worlds
RUN	mkdir -p /resource_packs
RUN	mkdir -p /behavior_packs

WORKDIR /minecraft

# Move files to editable folders and link them

RUN ln -s /files/server.properties /minecraft/server.properties && \
	ln -s /files/whitelist.json /minecraft/whitelist.json && \
	ln -s /files/permissions.json /minecraft/permissions.json && \
	ln -s /worlds /minecraft/worlds && \
	ln -s /resource_packs /minecraft/resource_packs && \
	ln -s /behavior_packs /minecraft/behavior_packs
	
# Get Minecraft Server files

RUN wget -q -O - https://kevlo.de/downloads/minecraft/bedrock/versions/1.11.4.2/bedrock.tar> /minecraft/bedrock.tar
RUN wget -q -O - https://kevlo.de/downloads/minecraft/bedrock/versions/1.11.4.2/run.sh > /minecraft/launch.sh && chmod +x /minecraft/launch.sh

RUN tar xfv bedrock.tar
RUN rm bedrock.tar


# Docker stuff

EXPOSE 19132/udp
	
VOLUME /files
VOLUME /worlds
VOLUME /resource_packs
VOLUME /behavior_packs

CMD [ "bash", "/minecraft/launch.sh"]