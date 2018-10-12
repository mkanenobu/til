#!/bin/bash
#L=20000
total=0
for i in {1..20000}; do
    for j in {1..20000}; do
        total=$((total + i * j))
    done
done

echo "$total"
