#!/bin/bash
# 一行づつ読み込む
while read line; do
    echo "$line"
done < "$1"
