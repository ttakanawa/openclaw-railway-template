#!/bin/bash
set -e

# Fix /data ownership at runtime (after volume mount).
# Build-time chown is overwritten when Railway mounts the volume as root.
# Only chown if not already owned by openclaw (skip on subsequent boots).
if [ "$(stat -c %U /data 2>/dev/null)" != "openclaw" ]; then
  chown -R openclaw:openclaw /data
fi

exec gosu openclaw "$@"
