#!/usr/bin/env bash

s="$(cat << EOS
1
2
3
EOS
)"

if [ "$(echo "$s" | grep -q "1")" ]; then
  echo "1 is not included"
else
  echo "1 is included"
fi
