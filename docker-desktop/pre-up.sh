#!/bin/bash -e

network="bosh-docker"
subnet="10.245.0.0/16"

if ! docker network ls | grep -q ${network}; then
    echo "Creating docker network: ${network} with range: ${subnet}"
    docker network create -d bridge --subnet=${subnet} ${network} --attachable 1>/dev/null
else
    echo "Using existing docker network: ${network}"
fi
