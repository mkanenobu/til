import math
import sugar
import strformat

const approximation = (n: float) => sqrt(2.0 * PI * n) * pow((n / E), n)

proc compare(n: int) =
  echo &"true value: {fac(n)}"
  echo &"approximation: {approximation(float(n))}"

compare(2)
compare(10)
compare(15)