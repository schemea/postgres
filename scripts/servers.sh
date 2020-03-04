#!/usr/bin/env bash

mkdir -p "$WD/config"

(cat <<JSON
{
  "Servers": {
    "1": {
      "Name": "$POSTGRES_DB",
      "Group": "Servers",
      "Host": "host.docker.internal",
      "Port": "$POSTGRES_PORT",
      "Username": "$POSTGRES_USER",
      "SSLMode": "prefer",
      "MaintenanceDB": "postgres",
      "PassFile": "/pgadmin4/.pgpass"
    }
  }
}
JSON
) > "/pgadmin4/servers.json"
