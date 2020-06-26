proc binomialCoeff(n, k: int): int =
  var res = 1
  var k2 = k
  if (k2 > n - k2):
    k2 = n - k2
  for i in 0..<k2:
    res = res * (n - i)
    res = res div (i + 1)
  return res

proc pascalTriangle(step: int) =
  for line in 0..<step:
    for i in 0..line:
      stdout.write(binomialCoeff(line, i))
    echo ""


pascalTriangle(5)