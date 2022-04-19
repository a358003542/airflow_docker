#!/usr/bin/env bash

export uname=$(whoami)
export uid=$(id -u)
export gid=$(id -g)

exec docker-compose "$@"
