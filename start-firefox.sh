#!/bin/bash

[[ -z "$gid" ]] || groupmod --non-unique --gid $gid firefox
[[ -z "$uid" && -z "$gid" ]] || usermod --non-unique --uid $uid --gid $gid firefox

if [ -d /home/firefox/.mozilla ]; then
  chown -R firefox:firefox /home/firefox/.mozilla
fi

exec su -ls "/bin/bash" -c "/usr/bin/firefox -profile /home/firefox/.mozilla/firefox $URL" firefox
