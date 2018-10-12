#!/bin/bash
num=0
for i in $(seq 30); do
    echo -n "$num"","
    num=$((num + 1))
    #num=`expr $num + 1`    #this is very slow
done
