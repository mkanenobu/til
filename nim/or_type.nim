proc myEcho(x: int or string) =
  echo x

proc by[T: int | float](v: T): T = v * 2

myEcho("Hello")
myEcho(1)

echo 5.by
echo 2.3.by
