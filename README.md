# Docker image with Firefox and Java Webstart support

This image launches Firefox with support for Java Webstart applications.

## Versions

| App     | Version |
| ------- | ------- |
| Firefox | 52.8.0  |
| Java    | 1.8.0   |

## Setup

```sh
docker pull ugrawert/firefox-java:latest
```

## Run

```sh
xhost +local:docker
```

```sh
URL=https://remote-board/;
docker run --rm -ti \
           -v "${HOME}/Downloads:/home/firefox/Downloads:rw" \
           -v "/tmp/.X11-unix:/tmp/.X11-unix" \
           -v "/dev/snd:/dev/snd" \
           --privileged \
           -e "DISPLAY=unix${DISPLAY}" \
           -e "uid=$(id -u)" \
           -e "gid=$(id -g)" \
           -e "URL=${URL}" \
           ugrawert/firefox-java
```
