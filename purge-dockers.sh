#!/usr/bin/env bash

# delete all containers
docker rm $(docker ps -a -q)

# delete all images
docker rmi $(docker images -q)
