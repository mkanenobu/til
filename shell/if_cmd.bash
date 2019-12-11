#!/usr/bin/env bash

if ls 1>/dev/null 2>/dev/null; then
  echo 'ls success'
else
  echo 'ls failed'
fi
