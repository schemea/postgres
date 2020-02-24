#!/usr/bin/env bash

if [ -z "$POSTGRES_PORT" ]; then
    POSTGRES_PORT=5430
fi

if [ -z "$POSTGRES_USER" ]; then
    POSTGRES_USER=simplon
fi

if [ -z "$POSTGRES_PASSWORD" ]; then
    POSTGRES_PASSWORD=simplon
fi

if [ -z "$POSTGRES_DB" ]; then
    POSTGRES_DB=simplon
fi
