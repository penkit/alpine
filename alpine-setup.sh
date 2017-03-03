#!/bin/sh
set -ex

# add alpine repo for penkit
echo "http://apk.penkit.io/penkit/main" >> /etc/apk/repositories

# install system tools for entrypoint
apk --no-cache add \
  bash \
  su-exec \
  tini

# self destruct
rm -- "$0"
