#!/bin/bash
# https://docs.linuxserver.io/images/docker-transmission

CONFIG_DIR=$(pwd)/config
DOWNLOADS_DIR=$(pwd)/downloads
WATCH_DIR=$(pwd)/watch

create_dir_if_not_exists () {    
    if [[ -d "$1" ]]
    then
	echo "-> Directory already exists " $1
    else
	mkdir $1
    fi
}

create_dir_if_not_exists $CONFIG_DIR
create_dir_if_not_exists $DOWNLOADS_DIR
create_dir_if_not_exists $WATCH_DIR

docker run -d \
  --name=transmission \
  -e PUID=1001 \
  -e PGID=1001 \
  -e TZ=America/Mexico_City \
#  -e TRANSMISSION_WEB_HOME=/combustion-release/ `#optional` \
#  -e USER=username `#optional` \
#  -e PASS=password `#optional` \
#  -e WHITELIST=iplist `#optional` \
#  -e HOST_WHITELIST=dnsnane list `#optional` \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v $CONFIG_DIR:/config \
  -v $DOWNLOADS_DIR:/downloads \
  -v $WATCH_DIR:/watch \
  --restart unless-stopped \
  lscr.io/linuxserver/transmission
