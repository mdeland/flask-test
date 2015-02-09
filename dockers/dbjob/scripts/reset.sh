#!/bin/bash

DB_HOST=$POSTGRES_PORT_5432_TCP_ADDR
DB_PORT=5432
DB_USER=postgres
DB_NAME=postgres

dropdb \
  -h $DB_HOST \
  -p $DB_PORT \
  -U $DB_USER \
  $DB_NAME \
  || { echo 'reset.sh: unable to drop DB'; exit 1; }

createdb \
  -h $DB_HOST \
  -p $DB_PORT \
  -U $DB_USER \
  $DB_NAME \
  || { echo 'reset.sh: unable to recreate DB'; exit 1; }

psql \
  -h $DB_HOST \
  -p $DB_PORT \
  -U $DB_USER \
  -d $DB_NAME \
  -c "drop table if exists counts"

psql \
  -h $DB_HOST \
  -p $DB_PORT \
  -c "create table counts (route text, count int)" \
  -U $DB_USER \
  -d $DB_NAME

psql \
  -h $DB_HOST \
  -p $DB_PORT \
  -c "insert into counts values ('/', 0)" \
  -U $DB_USER \
  -d $DB_NAME

echo "reset.sh: success"
