#!/usr/bin/env bash

s="1
2
3"

echo "$(echo "${s}" | sed 1d)"
