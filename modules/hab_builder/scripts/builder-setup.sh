#!/bin/bash

while getopts "u:i:s:" opt; do
  case ${opt} in
    u ) PUBURL=$OPTARG
      ;;
    i ) OAUTHCID=$OPTARG
      ;;
    s ) OAUTHCSEC=$OPTARG
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

# Pull the on-prem-builder repo
cd /tmp
if [ ! -d "/tmp/on-prem-builder" ]; then
  echo "Pulling down On-Prem Builder repository"
  git clone https://github.com/habitat-sh/on-prem-builder.git
  check_status
else
  echo "Already pulled the repo down. Moving along"
fi

# Copy our LetsEncrypt Certs into the new on-prem-builder directory
cp -a $(realpath /etc/letsencrypt/live/${PUBURL}/fullchain.pem) /tmp/on-prem-builder/ssl-certificate.crt
cp -a $(realpath /etc/letsencrypt/live/${PUBURL}/privkey.pem) /tmp/on-prem-builder/ssl-certificate.key
check_status

# Create the bldr.env file
cd /tmp/on-prem-builder

if [ ! -f "/tmp/on-prem-builder/bldr.env" ]; then
  echo "Creating bldr.env file"
  tee /tmp/on-prem-builder/bldr.env <<-EOF
    #!/bin/bash

    export POSTGRES_HOST=localhost
    export POSTGRES_PORT=5432

    export MINIO_ENDPOINT=http://localhost:9000
    export MINIO_BUCKET=habitat-builder-artifact-store.local
    export MINIO_ACCESS_KEY=depot
    export MINIO_SECRET_KEY=password

    export APP_SSL_ENABLED=true
    export APP_URL=https://${PUBURL}

    export OAUTH_PROVIDER=github
    export OAUTH_USERINFO_URL=https://api.github.com/user
    export OAUTH_AUTHORIZE_URL=https://github.com/login/oauth/authorize
    export OAUTH_SIGNUP_URL=https://github.com/join
    export OAUTH_TOKEN_URL=https://github.com/login/oauth/access_token
    export OAUTH_REDIRECT_URL=https://${PUBURL}/
    export OAUTH_CLIENT_ID=${OAUTHCID}
    export OAUTH_CLIENT_SECRET=${OAUTHCSEC}

    export BLDR_CHANNEL=on-prem-stable
    export BLDR_ORIGIN=habitat
    export HAB_BLDR_URL=https://bldr.habitat.sh/

    export ANALYTICS_ENABLED=false
    export ANALYTICS_COMPANY_NAME=""
EOF
else
  echo "Already created the bldr.env"
fi

# Install Builder
if [[ ! $(hab svc status | grep "/builder-api/" | awk '{print $4}' | grep "up") ]]; then
  echo "Installing Hab Builder"
  export HAB_LICENSE="accept"
  /tmp/on-prem-builder/install.sh
  check_status
  echo "Hab Builder Install Completed"

  # Restart Hab-Sup
  echo "Restarting hab-sup, because the docs say so"
  systemctl restart hab-sup
  check_status
  echo "Finished with the builder-setup.sh script"
else
  echo "Hab Builder Appears to be running already. Moving on."
  echo "Finished with the builder-setup.sh script"
fi
