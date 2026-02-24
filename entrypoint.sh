#!/bin/bash
set -e

# Fix volume ownership at runtime (after volume mount).
# Build-time chown is overwritten when Railway mounts the volume as root.
# Only chown if not already owned by node (skip on subsequent boots).
if [ "$(stat -c %U /home/node/.openclaw 2>/dev/null)" != "node" ]; then
  chown -R node:node /home/node/.openclaw
fi

exec gosu node "$@"
