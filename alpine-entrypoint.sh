#!/bin/sh
set -e

# descalate permissions to non-root user if starting as root and RUN_AS is set
if [ -n "$RUN_AS" ] && [ "$(id -u)" = "0" ]; then
  set -- su-exec "$RUN_AS" $@
fi

# use tini as the init process unless asked to skip it
if [ -z "$SKIP_INIT" ]; then
  set -- /sbin/tini -- $@
fi

# execute the passed command
exec $@
