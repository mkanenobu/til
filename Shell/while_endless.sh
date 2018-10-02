#!/bin/bash
# null    infinite loop
echo "When you type '"a"', Then break"
read key
while : ; do
    if [ "$key" = "a" ]; then
        echo " break..."
        break
    fi
    read key
done
