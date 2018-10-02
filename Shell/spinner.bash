#!/bin/bash

chars='/-\|'

while :; do
    for (( i=0; i<${#chars}; i++ )); do
        sleep 0.1
        echo -en "${chars:$i:1}" "\r"
    done
done
