template hoge(): untyped =
  var
    name {.inject.} : string = "Hello"
    age {.inject.} : int = 26

hoge()
echo name
