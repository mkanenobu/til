var
  a, b, c: int
  arr = [1, 2, 3]
  sequence = @[11, 22, 33]
  tuple1 = (111, 222, 333)

(a, b, c) = arr
echo [a, b, c]

(a, b, c) = sequence
echo @[a, b, c]

(a, b, c) = tuple1
echo (a, b, c)