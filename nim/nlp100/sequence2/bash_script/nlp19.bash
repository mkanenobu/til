#!/usr/bin/env bash

cat ./hightemp.txt | cut -f 1 | sort | uniq -c | sort -k 1 -r
