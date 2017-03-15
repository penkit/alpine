NORMAL="\[\e[0m\]"
BLUE="\[\e[1;34m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
if [ "$(whoami)" = "root" ]; then
  PS1="$RED\u@\h $BLUE\w$NORMAL # $NORMAL"
else
  PS1="$GREEN\u@\h $BLUE\w$NORMAL \$ $NORMAL"
fi
