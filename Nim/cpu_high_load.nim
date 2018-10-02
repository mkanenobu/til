var
  L = 20000
  total = 0

for i in 0..L:
  for j in 0..L:
    total = total + i * j

echo total
