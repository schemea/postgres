#!/usr/bin/env bash

. "$(dirname "$0")/scripts/variables.sh"

CONTAINER="$(docker ps -q --filter name="$POSTGRES_CONTAINER")"

if [ -z "$CONTAINER" ]; then
  echo  "container $PGADMIN_CONTAINER not running"
else
  docker stop "$CONTAINER"
fi
