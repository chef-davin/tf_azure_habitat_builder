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
  export HAB_AUTH_TOKEN="_Qk9YLTEKYmxkci0yMDIxMTEwODE3NTQ0OApibGRyLTIwMjExMTA4MTc1NDQ4CnhpUVZpZzdnWkVKNkROWGNaRHBGY0ZrU3hRakg0bHJUCjBOQk8rQnVCNkpmUEVSTGR2Y01va2dQK2Z1ZnVSV2lBK3JBMGNISEVlVUFDWGp2ag=="
  hab pkg bulkupload --url https://${PUBURL} --channel stable --auto-create-origins /hab/builder_bootstrap/
  check_status
else
  echo "Bulk Upload of packages has already completed. Moving on"
fi
