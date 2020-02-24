#!/usr/bin/env bash
WD="$( cd "$(dirname "$0")" > /dev/null 2>&1 ; pwd -P )"

. "$WD/scripts/postgres_default.sh"

export MSYS_NO_PATHCONV=1

docker pull postgres
docker run -d --rm --name "simplon-postgres" -v "simplon-postgres-volume:/var/lib/postgresql/data" -p "$POSTGRES_PORT:5432" -e "POSTGRES_PORT=$POSTGRES_PORT" \
 -e "POSTGRES_PASSWORD=$POSTGRES_PASSWORD" -e "POSTGRES_USER=$POSTGRES_USER" -e "POSTGRES_DB=$POSTGRES_DB" postgres

echo "----------------------------------------------------------------"
. "$WD/scripts/servers.sh"
echo "USER: $POSTGRES_USER"
echo "jdbc:postgresql://localhost:$POSTGRES_PORT/$POSTGRES_DB"
