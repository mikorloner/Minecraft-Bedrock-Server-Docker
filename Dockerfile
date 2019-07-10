FROM ubuntu:18.04

MAINTAINER Kevin Hein <kevin.h@kevlo.de>

# Install dependencies

RUN apt-get update && \
	apt-get -y install wget && \
	apt-get -y install libcurl3

# Create folders

RUN	mkdir -p /minecraft
#RUN	mkdir -p /data
#RUN	mkdir -p /worlds
#RUN	mkdir -p /minecraft/worlds
#RUN	mkdir -p /resource_packs
#RUN	mkdir -p /behavior_packs

WORKDIR /minecraft

# Get Minecraft Server files

RUN wget -q -O - https://kevlo.de/downloads/minecraft/bedrock/versions/1.11.4.2/bedrock.tar> /minecraft/bedrock.tar
RUN wget -q -O - https://kevlo.de/downloads/minecraft/bedrock/versions/1.11.4.2/run.sh > /minecraft/launch.sh && chmod +x /minecraft/launch.sh

RUN tar xfv bedrock.tar
RUN rm bedrock.tar

# Move files to editable folders and link them

RUN ln -s /minecraft/server.properties /data/server.properties && \
	ln -s /minecraft/whitelist.json /data/whitelist.json && \
	ln -s /minecraft/permissions.json /data/permissions.json && \
	ln -s /minecraft/worlds/ /worlds/ && \
	ln -s /minecraft/resource_packs/ /resource_packs/ && \
	ln -s /minecraft/behavior_packs/ /behavior_packs/
	
# Docker stuff

EXPOSE 19132/udp
	
VOLUME /data/
VOLUME /worlds/
VOLUME /resource_packs/
VOLUME /behavior_packs/

CMD [ "bash", "/minecraft/launch.sh"]
