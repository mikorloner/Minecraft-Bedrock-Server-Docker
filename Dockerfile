FROM ubuntu:18.04

MAINTAINER Kevin Hein <kevin.h@kevlo.de>

# Install dependencies

RUN apt-get update && \
	apt-get -y install wget && \
	apt-get -y install libcurl3

# Create folder

RUN mkdir -p /minecraft/files

WORKDIR /minecraft

# Get Minecraft Server files

#RUN wget -q -O - https://kevlo.de/downloads/minecraft/bedrock/versions/1.11.4.2/bedrock.tar> /minecraft/files/bedrock.tar
RUN wget -q -O - https://kevlo.de/downloads/minecraft/bedrock/versions/1.11.4.2/launch.sh > /minecraft/launch.sh && chmod +x /minecraft/launch.sh

#RUN tar xfv /minecraft/files/bedrock.tar -C /minecraft/files/
#RUN rm /minecraft/files/bedrock.tar

# Docker stuff

EXPOSE 19132/udp
	
VOLUME /minecraft/files

CMD [ "bash", "/minecraft/launch.sh"]
