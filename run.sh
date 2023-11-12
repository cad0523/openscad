#!/bin/bash

# set environment
export DIR=$(cd $(dirname $0);pwd)
export NAME=openscad
export VERSION=2021.01
export IMG=${NAME}/${NAME}


# pull image
docker pull ${IMG}:${VERSION}

mkdir -p ${DIR}/volume
# docker run -it --rm -v ${DIR}/volume:/home ${IMG}
# cp /root/.bashrc /home/
# echo "export DISPLAY=192.168.1.xxx:0.0" >> ./volume/.bashrc
docker run \
    -it --rm \
    -u $(id -u):$(id -g) \
    -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro \
    -v ${DIR}/volume:/home/${USER} \
    --name ${NAME} \
    ${IMG}:${VERSION}
