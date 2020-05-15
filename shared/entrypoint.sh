#!/usr/bin/dumb-init /bin/bash
set -euo pipefail

# first arg is `-f` or `--some-option`
#if [ "${1#-}" != "$1" ]; then
#	set -- hugo  "$@"
#fi

exec "$@"
