#!/bin/bash

docker build -t karsajobs-ui:latest .

docker tag karsajobs-ui:latest ghcr.io/akhsaul/karsajobs-ui:latest

echo $PASSWORD_DOCKER_HUB | docker login ghcr.io -u akhsaul --password-stdin

docker push ghcr.io/akhsaul/karsajobs-ui:latest
