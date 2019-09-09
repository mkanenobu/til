import options

var
  optional_s: Option[string] = option("hoge")
  s: string = optional_s.unsafeGet

echo optional_s.typeof
echo s.typeof
