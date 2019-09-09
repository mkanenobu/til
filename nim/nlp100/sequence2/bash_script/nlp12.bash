#!/usr/bin/env bash

cat ./hightemp.txt | cut -f 1 >| col1.txt
cat ./hightemp.txt | cut -f 2 >| col2.txt

