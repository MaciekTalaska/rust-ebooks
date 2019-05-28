#!/usr/bin/env bash

# delete all containers
docker rm $(docker ps -a -q) --force

# delete all images
docker rmi $(docker images -q) --force
