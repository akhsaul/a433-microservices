#!/bin/bash

# build image in current directory with name item-app and tag v1
docker build -t item-app:v1 .

# get list of image in local docker
docker images

# make tag for current image
docker tag item-app:v1 ghcr.io/akhsaul/item-app:v1

# login to github packages
echo $PASSWORD_DOCKER_HUB | docker login ghcr.io -u akhsaul --password-stdin

# push current image to github packages
docker push ghcr.io/akhsaul/item-app:v1
