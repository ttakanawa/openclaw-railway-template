#!/bin/bash
set -e

# Fix /data ownership at runtime (after volume mount).
# Build-time chown is overwritten when Railway mounts the volume as root.
chown -R openclaw:openclaw /data

exec gosu openclaw "$@"
