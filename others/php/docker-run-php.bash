#!/usr/bin/env bash

docker run -it --rm --name run-script \
  -v "$PWD":/usr/src/app -w /usr/src/app \
  php:7.4-cli \
  php "${1}"
