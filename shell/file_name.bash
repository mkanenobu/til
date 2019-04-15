#!/usr/bin/env bash

filename="test.sh"

without_ext="${filename%.*}"
echo "${without_ext}"

extension="${filename##*.}"
echo "${extension}"

