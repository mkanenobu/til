var
  g = 0

proc writeAccessToG(): var int =
  result = g

writeAccessToG() = 6

echo g
