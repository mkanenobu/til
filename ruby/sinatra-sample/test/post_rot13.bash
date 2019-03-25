#!/usr/bin/env bash

curl -X POST -H 'Contents-Type: application/json' \
  -d '{"paragraph": "Hello, World!"}' \
  localhost:8080/rot13

