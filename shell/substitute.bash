#!/usr/bin/env bash

s="string"
echo "$s" | sed -e 's/st/ika/g'
# or
echo "${s//st/ika}"
