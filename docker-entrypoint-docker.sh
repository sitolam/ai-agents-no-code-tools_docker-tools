#!/bin/sh
# Find the group id (GID) of docker.sock
DOCKER_GID=$(stat -c '%g' /var/run/docker.sock)

# Check if a group with this GID exists
GROUP_NAME=$(getent group $DOCKER_GID | cut -d: -f1)

if [ -z "$GROUP_NAME" ]; then
  # Create docker group with the GID of docker.sock
  GROUP_NAME=dockersock
  addgroup -g $DOCKER_GID $GROUP_NAME
fi

# Add node user to this group (safe to try even if already present)
addgroup node $GROUP_NAME

# Drop to node user and run the CMD
exec su-exec node "$@"
