#!/bin/bash

while getopts "u:g:e:" opt; do
  case ${opt} in
    u ) PUBURL=$OPTARG
      ;;
    g ) GITHUB_USER_NAME=$OPTARG
      ;;
    e ) GITHUB_USER_EMAIL=$OPTARG
      ;;
    \? ) echo "Bad Command Option"; exit 1
      ;;
  esac
done

check_status() {
  retVal=$?
  if [ $retVal -ne 0 ]; then
    echo "Error"
    exit $retVal
  fi
}

export PGPASSWORD=$(sudo cat /hab/svc/builder-datastore/config/pwfile)
if [[ ! $(/hab/pkgs/core/postgresql/*/*/bin/psql -h 127.0.0.1 -p 5432 -U hab -d builder -c "select token from account_tokens;" | grep "AwM2FXVw==") ]]; then
  echo "Loading Database Data"
  # Setup Builder SQL Loader File
  sed -i "s/chef-davin/${GITHUB_USER_NAME}/g" /tmp/load-builder.sql
  sed -i "s/Davin.Taddeo@progess.com/${GITHUB_USER_EMAIL}/g" /tmp/load-builder.sql
  check_status

  # Stop builder-api service
  hab svc stop habitat/builder-api
  check_status

  # Load builder data so we can auto-load the core origin
  export PGPASSWORD=$(sudo cat /hab/svc/builder-datastore/config/pwfile)
  /hab/pkgs/core/postgresql/*/*/bin/psql -h 127.0.0.1 -p 5432 -U hab -d postgres -c 'DROP DATABASE builder;'
  check_status
  /hab/pkgs/core/postgresql/*/*/bin/psql -h 127.0.0.1 -p 5432 -U hab -d postgres -c 'CREATE DATABASE builder;'
  check_status
  /hab/pkgs/core/postgresql/*/*/bin/psql -h 127.0.0.1 -p 5432 -U hab -d builder < /tmp/load-builder.sql
  check_status

  # Start builder-api service again
  hab svc start habitat/builder-api
  check_status
else
  echo "Database data has already been loaded. Moving on"
fi

echo "Database data has been loaded successfully"