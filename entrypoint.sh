#!/bin/bash
set -e

# Fix volume ownership at runtime (after volume mount).
# Build-time chown is overwritten when Railway mounts the volume as root.
# Only chown if not already owned by openclaw (skip on subsequent boots).
if [ "$(stat -c %U /home/openclaw/.openclaw 2>/dev/null)" != "openclaw" ]; then
  chown -R openclaw:openclaw /home/openclaw/.openclaw
fi

exec gosu openclaw "$@"
