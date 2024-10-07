#!/bin/bash

./pre_up.sh

bosh int ../bosh.yml \
  -o ../docker/cpi.yml \
  -o ../docker/unix-sock.yml \
  -o ../bosh-lite-docker.yml \
  -o ./1-extra-ports.yml \
  -o ./2-no-ntp.yml \
  -o ./8-localhost.yml \
  -o ../uaa.yml \
  -o ../credhub.yml \
  -o ../jumpbox-user.yml \
  --vars-store ./creds.yml \
  -v director_name=bosh-docker \
  -v docker_host=unix:///var/run/docker.sock \
  -v internal_cidr=10.245.0.0/16 \
  -v internal_gw=10.245.0.1 \
  -v static_ip=10.245.0.10 \
  -v internal_ip=localhost \
  -v network=bosh-docker
  # --state ./state.json \
