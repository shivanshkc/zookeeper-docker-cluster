#!/bin/bash

CONTAINER_NAME=zookeeper-1

SERVER1_CONF="0.0.0.0:2888:3888;2181"
SERVER2_CONF="y.y.y.y:22888:23888;22181"
SERVER3_CONF="z.z.z.z:32888:33888;32181"

echo "################## Removing previous container ##################"
docker rm -f $CONTAINER_NAME

echo "##################### Running new container #####################"
docker run \
        --detach \
        --name $CONTAINER_NAME \
        --restart unless-stopped \
        --publish 12181:2181 \
        --publish 12888:2888 \
        --publish 13888:3888 \
        --env "ZOO_MY_ID=1" \
        --env "ZOO_SERVERS=server.1=$SERVER1_CONF server.2=$SERVER2_CONF server.3=$SERVER3_CONF" \
        --volumes $VOLUME/$CONTAINER_NAME/data:/data \
        --volumes $VOLUME/$CONTAINER_NAME/datalog:/datalog \
        zookeeper:3.6
