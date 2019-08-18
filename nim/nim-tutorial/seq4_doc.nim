## sample of builtin document generater
type Person* = object
  ## This type contains name and age
  name: string
  age: int

proc f1*(n: int) =
  ## f1 takes 1 args(n: int)
  echo n

proc provateFun(x: string) =
  ## not generate private function
  echo x

proc f2*(x: int, y: string): string =
  ## f2 takes 2 args
  ## x: int and y: string
  ## returns string
  return $x & y

proc f3*() =
  ## f3 raise exception
  raise
