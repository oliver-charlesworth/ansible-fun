#!/usr/bin/env bash
set -eu
DIR=$(dirname $0)

USER=${1}

useradd ${USER}
cd /home/${USER}
cp -r ${DIR}/.ssh .
chmod 700 .ssh
cat .ssh/id_rsa.pub >> .ssh/authorized_keys
chmod 600 .ssh/*
chown -R ${USER}: .ssh
