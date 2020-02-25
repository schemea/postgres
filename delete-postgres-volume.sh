#!/usr/bin/env bash

. "$(dirname "$0")/scripts/variables.sh"

docker volume rm "$POSTGRES_VOLUME"
