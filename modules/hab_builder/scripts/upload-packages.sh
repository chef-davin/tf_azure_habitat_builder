#!/bin/bash

while getopts "u:" opt; do
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
  export HAB_AUTH_TOKEN="_Qk9YLTEKYmxkci0yMDIxMTEwODE1MzI0MwpibGRyLTIwMjExMTA4MTUzMjQzCnkrdHNjUzhtUHNMNlNhYjBkTDZETWFoSUFHc3BEbFJnCnFTOWlkUVQ2dmlQRk4xa3B4Qk1LU0crbnFpNnJ6Y1BibkxHeHJJNHNyamhqaElPNQ=="
  hab pkg bulkupload --url https://${PUBURL} --channel stable --auto-create-origins /hab/builder_bootstrap/
  check_status
else
  echo "Bulk Upload of packages has already completed. Moving on"
fi
