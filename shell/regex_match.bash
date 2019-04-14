#!/usr/bin/env bash

s="abcdef"
if [[ $s =~ ^abc ]]; then
  echo "matched"
fi

regex='def$'
if [[ $s =~ $regex ]]; then
  echo "matched"
fi
