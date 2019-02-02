#!/bin/bash

a=true
b="$(if [ "${a}" ]; then echo "stack "; fi) runghc"
echo $b
