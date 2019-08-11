#!/usr/bin/env bash

exists_commands() {
  commands="$*"
  for command_ in ${commands}; do
    type "${command_}" 1>/dev/null 2>/dev/null
    exists=$?
    if [ "${exists}" -eq 0 ]; then
      echo -n "${command_}"
      break
    fi
  done
}

echo "$(exists_commands "hoge ls")"
if [ -z "$(exists_commands "aaaaa qweasd")" ]; then
  echo "not found"
fi
