#!/usr/bin/env bash

if [ -z "$PGADMIN_EMAIL" ]; then
  PGADMIN_EMAIL="admin@postgres.org"
fi

if [ -z "$PGADMIN_PASSWORD" ]; then
  PGADMIN_PASSWORD="admin"
fi

if [ -z "$PGADMIN_PORT" ]; then
  PGADMIN_PORT=5431
fi
