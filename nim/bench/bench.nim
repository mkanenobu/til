# for runtime benchmark
# gcc, clang, icc
import math, times

const max = 10000000

var
  sins, coses, num: float64 = 0.0
  bTime = epochTime()

for i in 0..<max:
  num = float64(i)
  sins += sin(num)
  coses += cos(num)

echo epochTime() - bTime
echo sins
echo coses
