#!/usr/bin/env bash

if type "ls"; then
  echo "exists ls"
fi

if type "aaaaaaaaa"; then
  echo "exists aaaaaaa"
else
  echo "not exists aaaaaaaa"
fi

