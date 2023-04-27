#!/bin/bash

VERSION=2.2

## This script is used to build or run docker container, if user provide -b option, it will build container, then run it.
## If no any args, then just run it 
if [ "$1" == "-b" ]; then
    docker build -t hieisky/ubuntu-base:$VERSION .
fi

docker run -d -t --name ubuntu_base -p 4567:22 -v /vagrant/container-share:/vagrant "hieisky/ubuntu-base:$VERSION"