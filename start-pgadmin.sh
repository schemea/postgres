#!/usr/bin/env bash

WD="$( cd "$(dirname "$0")" > /dev/null 2>&1 ; pwd -P )"

if [ ! -f "$WD/config/servers.json" ]; then
    echo "please start postgres database"
    exit
fi

. "$WD/scripts/variables.sh"

if [ -n "$(docker ps -q --filter name="$PGADMIN_CONTAINER")" ]; then
  echo "Container already exists"
  exit
fi

. "$WD/scripts/postgres_default.sh"
. "$WD/scripts/pgadmin_default.sh"

export MSYS_NO_PATHCONV=1

docker pull dpage/pgadmin4
docker run -d --rm -p "$PGADMIN_PORT:80" --name "$PGADMIN_CONTAINER" -v "$PGADMIN_VOLUME:/var/lib/pgadmin" \
 -v "$WD/config/servers.json:/pgadmin4/servers.json"  -e "PGADMIN_DEFAULT_EMAIL=$PGADMIN_EMAIL" -e "PGADMIN_DEFAULT_PASSWORD=$PGADMIN_PASSWORD" dpage/pgadmin4

echo "----------------------------------------------------------------"
echo "http://localhost:$PGADMIN_PORT"
echo "EMAIL: $PGADMIN_EMAIL"
echo "PASSWORD: $PGADMIN_PASSWORD"
echo "DATABASE PASSWORD: $POSTGRES_PASSWORD"
