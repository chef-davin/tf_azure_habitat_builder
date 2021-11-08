#!/bin/bash

while getopts "u:m:" opt; do
  case ${opt} in
    u ) PUBURL=$OPTARG
      ;;
    m ) EMAIL=$OPTARG
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

# Prep the disk
if [[ ! $(mount | grep /hab) ]]; then
  mkdir /hab
  pvcreate /dev/sdb
  vgcreate vg_data /dev/sdb
  lvcreate -n lv_hab -l 90%VG vg_data
  mkfs.xfs -f /dev/vg_data/lv_hab
  echo -e "/dev/mapper/vg_data-lv_hab\t/hab\txfs\tdefaults\t0 0" >> /etc/fstab
  mount /hab
  check_status
  mkdir -p /hab/cache/keys
  check_status
else
  echo "No mounting required"
fi

# Prep system packages
yum install -y git epel-release
yum install -y certbot

# Generate LetsEncrypt SSL Cert
if [ ! $(realpath /etc/letsencrypt/live/${PUBURL}/fullchain.pem) ]; then
  echo "Acquiring LetsEncrypt SSL Cert for ${PUBURL}"
  certbot certonly --non-interactive --standalone --agree-tos -m ${EMAIL} -d ${PUBURL}
  check_status
else
  echo "LetsEncrypt cert already acquired. Moving along."
fi

echo "Initial Server Setup Completed Successfully"