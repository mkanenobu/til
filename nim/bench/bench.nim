# for runtime benchmark
# gcc, clang, icc
var n: int64 = 1
for i in 1..50000:
  for j in 1..50000:
    n = n + i * j

echo n
