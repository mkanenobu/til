#!/usr/bin/env bash

s="abcdef"
if [[ $s =~ ^abc ]]; then
  echo "matched"
fi

regex='def$'
if [[ $s =~ $regex ]]; then
  echo "matched"
fi

s="abcdef"
if [[ $s =~ bcd ]]; then
  echo "matched"
  echo "${BASH_REMATCH[0]}"
fi

s="abcdef"
if [[ $s =~ a... ]]; then
  echo "${BASH_REMATCH[0]}"
fi
