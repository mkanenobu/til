proc hoge[T](arg: T): seq[T] =
  return @[arg, arg, arg]

echo hoge('a')
echo hoge(123)

