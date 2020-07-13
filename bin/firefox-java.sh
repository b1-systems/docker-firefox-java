#!/bin/sh
#
# Put me into your PATH

NAME="firefox-java"
IMAGE="${IMAGE:-ugrawert/firefox-java}"
X11_SOCKET="${X11_SOCKET:-/tmp/.X11-unix}"
DOWNLOADS="${DOWNLOADS:-${HOME}/Downloads}"
PROFILE="$PWD/.ff_profile"
uid=${uid:-`id -u`}
gid=${gid:-`id -g`}
URL=${URL:-$1}

case "$OSTYPE" in
    darwin*)
        xhost | grep -q 'localhost' || xhost +localhost
        DOCKER_DISPLAY="${DOCKER_DISPLAY:-host.docker.internal:0}"
        ;;
    *)
        DOCKER_DISPLAY="${DOCKER_DISPLAY:-unix${DISPLAY}}"
        ;;
esac

docker run --rm -ti \
           -v "${PROFILE}:/home/firefox/.mozilla/firefox" \
           -v "${DOWNLOADS}:/home/firefox/Downloads:rw" \
           -v "${X11_SOCKET}:/tmp/.X11-unix" \
           -e "DISPLAY=${DOCKER_DISPLAY}" \
           -e "uid=${uid}" \
           -e "gid=${gid}" \
           -e "URL=${URL}" \
           --name ${NAME} \
           ${IMAGE}
