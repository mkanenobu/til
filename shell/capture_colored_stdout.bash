#!/usr/bin/env bash

exec_command="${1}"
out="$(script --flush --quiet --return /dev/null --command "${exec_command}")"
echo "$out"
