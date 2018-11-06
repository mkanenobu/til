#!/bin/bash

file="bench.nim"
  
nim c -f --hints:off --verbosity:3 --cc:gcc -o:"gcc_bench" "$file"
nim c -f --hints:off --verbosity:3 --cc:icc -o:"icc_bench" "$file"
nim c -f --hints:off --verbosity:3 --cc:clang -o:"clang_bench" "$file"
nim c -f --hints:off --verbosity:3 --cc:clang -o:"ucc_bench" "$file"

echo "gcc"
time ./gcc_bench
echo ""

echo "icc"
time ./icc_bench
echo ""

echo "clang"
time ./clang_bench
echo ""

echo "ucc"
time ./ucc_bench
echo ""

