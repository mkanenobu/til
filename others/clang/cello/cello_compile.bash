#!/usr/bin/env bash

filename="$1"
output="${filename//.c/}"
gcc -std=gnu99 "${filename}" -lCello -lm -lpthread -o "${output}"
