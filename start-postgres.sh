#!/usr/bin/env bash
WD="$( cd "$(dirname "$0")" > /dev/null 2>&1 ; pwd -P )"

. "$WD/scripts/variables.sh"
. "$WD/scripts/postgres_default.sh"

export MSYS_NO_PATHCONV=1

if [ -z "$(docker volume ls | awk '/simplon-postgres-volume/ {print $0}')" ]; then
  echo "Creating servers.json"
  . "$WD/scripts/servers.sh"
fi

if [ -n "$(docker ps -q --filter name="$POSTGRES_CONTAINER")" ]; then
  echo "Container already exists"
  exit
fi

docker pull postgres
docker run -d --rm --name "$POSTGRES_CONTAINER" -v "$POSTGRES_VOLUME:/var/lib/postgresql/data" -p "$POSTGRES_PORT:5432" -e "POSTGRES_PORT=$POSTGRES_PORT" \
 -e "POSTGRES_PASSWORD=$POSTGRES_PASSWORD" -e "POSTGRES_USER=$POSTGRES_USER" -e "POSTGRES_DB=$POSTGRES_DB" postgres

echo "----------------------------------------------------------------"
echo "USER: $POSTGRES_USER"
echo "jdbc:postgresql://localhost:$POSTGRES_PORT/$POSTGRES_DB"
