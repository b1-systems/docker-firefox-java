#!/bin/bash

[[ -z "$uid" ]] && echo "Please specify uid as environment variable" && exit 1;
[[ -z "$gid" ]] && echo "Please specify gid as environment variable" && exit 1;

groupmod --non-unique --gid $gid firefox
usermod --non-unique --uid $uid --gid $gid firefox

if [ -d /home/firefox/.mozilla ]; then
  chown -R firefox:firefox /home/firefox/.mozilla
fi

exec su -ls "/bin/bash" -c "/usr/bin/firefox -profile /home/firefox/.mozilla/firefox $ARGS $URL" firefox
