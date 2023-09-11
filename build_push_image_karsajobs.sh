#!/bin/bash

docker build -t karsajobs:latest .

docker tag karsajobs:latest ghcr.io/akhsaul/karsajobs:latest

echo $PASSWORD_DOCKER_HUB | docker login ghcr.io -u akhsaul --password-stdin

docker push ghcr.io/akhsaul/karsajobs:latest
