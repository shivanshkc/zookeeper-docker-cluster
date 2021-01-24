#!/bin/bash

CONTAINER_NAME=zookeeper-2
VOLUME=

SERVER1_CONF="x.x.x.x:12888:13888;12181"
SERVER2_CONF="0.0.0.0:2888:3888;2181"
SERVER3_CONF="z.z.z.z:32888:33888;32181"

echo "################## Removing previous container ##################"
docker rm -f $CONTAINER_NAME

echo "##################### Running new container #####################"
docker run \
        --detach \
        --name $CONTAINER_NAME \
        --restart unless-stopped \
        --publish 22181:2181 \
        --publish 22888:2888 \
        --publish 23888:3888 \
        --env "ZOO_MY_ID=2" \
        --env "ZOO_SERVERS=server.1=$SERVER1_CONF server.2=$SERVER2_CONF server.3=$SERVER3_CONF" \
        --volumes $VOLUME/$CONTAINER_NAME/data:/data \
        --volumes $VOLUME/$CONTAINER_NAME/datalog:/datalog \
        zookeeper:3.6
