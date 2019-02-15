#!/bin/sh

# ls
for i in *; do
  echo $i
done

# cat
while read line; do
  echo $line
done < "./sample.html"

