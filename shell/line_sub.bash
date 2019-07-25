#!/usr/bin/env bash
s="
abcd
abc
efg
hij
123
456
789
"

# echo "${s}" | awk '/abc$/,/123/'
echo "${s}" | ruby -pe ''
