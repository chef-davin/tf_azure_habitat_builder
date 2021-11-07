#!/bin/bash

while getopts "u:g:e:" opt; do
  case ${opt} in
    u ) PUBURL=$OPTARG
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

# Bulk Upload the packages to our on-prem builder
if [[ ! $(hab pkg search --url https://${PUBURL} habitat/builder-memcached | grep builder) ]]; then
  echo "Starting Bulk Upload of Packages"
  export HAB_AUTH_TOKEN="_Qk9YLTEKYmxkci0yMDIxMTEwNzAxNDUxOQpibGRyLTIwMjExMTA3MDE0NTE5ClJIUzNMMlI5OU90L2dydG9YV1dvTkd0K2IwY2szME9JCmZ2Q1REY0VUbUN5L1VESzZiS3FiSnJuOTBJVzFTSGVLNWY0K3IxSG9JanAwM2FXVw=="
  hab pkg bulkupload --url https://${PUBURL} --channel stable --auto-create-origins builder_bootstrap/
  check_status
else
  echo "Bulk Upload of packages has already completed. Moving on"
fi
