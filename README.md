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

## Environment variables

The following environment variables can be passed via `docker run -e`.

| Variable  | Explanation                 | Example                |
| --------- | --------------------------- | ---------------------- |
| DISPLAY   | The X11 display port to use | DISPLAY=:1             |
| URL       | Firefox opens this URL      | URL=http://google.com/ |
| uid       | Run Firefox with this uid   | uid=$(id -u)           |
| gid       | Run Firefox with this gid   | gid=$(id -u)           |

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
           -e "DISPLAY=unix${DISPLAY}" \
           -e "uid=$(id -u)" \
           -e "gid=$(id -g)" \
           -e "URL=${URL}" \
           ugrawert/firefox-java
```
