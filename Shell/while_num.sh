#!/bin/bash
num=0
# $numが100でないときnum+1して出力
while test "$num" -ne 100;do
    echo -n "$num"","
    num=$((num + 1))
done

