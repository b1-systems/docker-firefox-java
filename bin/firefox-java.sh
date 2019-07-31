#!/bin/bash
#
# Put me into your PATH

NAME="firefox-java"
IMAGE="${IMAGE:-ugrawert/firefox-java}"
X11_SOCKET="${X11_SOCKET:-/tmp/.X11-unix}"
DOCKER_DISPLAY="${DOCKER_DISPLAY:-unix${DISPLAY}}"
DOWNLOADS="${DOWNLOADS:-${HOME}/Downloads}"
uid=${uid:-$(id -u)}
gid=${gid:-$(id -g)}
URL=${URL:-$1}

xhost | grep -q 'LOCAL' || echo "You might have to run 'xhost +local:docker'"

docker run --rm -ti \
           -v "${DOWNLOADS}:/home/firefox/Downloads:rw" \
           -v "${X11_SOCKET}:/tmp/.X11-unix" \
           -e "DISPLAY=${DOCKER_DISPLAY}" \
           -e "uid=${uid}" \
           -e "gid=${gid}" \
           -e "URL=${URL}" \
           --name ${NAME} \
           ${IMAGE}
