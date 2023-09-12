#!/bin/bash
VERSION="latest"

## This script is used to build or run docker container, if user provide -b option, it will build container, then run it.
## If no any args, then just run it 
if [ "$1" == "-b" ]; then
    docker build -t hieisky/ubuntu-base:$VERSION .
fi

docker run -it --rm -v ~/.ssh:/home/ubuntu/.ssh "hieisky/ubuntu-base:$VERSION" 