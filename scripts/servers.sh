#!/usr/bin/env bash

(cat <<JSON
{
  "Servers": {
    "1": {
      "Name": "$POSTGRES_DB",
      "Group": "Servers",
      "Host": "simplon-postgres",
      "Port": "5432",
      "Username": "$POSTGRES_USER",
      "SSLMode": "prefer",
      "MaintenanceDB": "postgres"
    }
  }
}
JSON
) > "/pgadmin4/servers.json"
