#!/usr/bin/env bash

cat ./hightemp.txt | split -l --additional-suffix="hightemp-" "${1}"
