#!/bin/sh
set -ex

# install system tools for entrypoint
apk --no-cache add \
  bash \
  su-exec \
  tini

# self destruct
rm -- "$0"
