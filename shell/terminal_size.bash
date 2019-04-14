#!/usr/bin/env bash
tput lines
tput cols

echo ${LINES}
echo ${COLUMNS}

stty size
