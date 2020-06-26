import options

var
  optionalS: Option[string] = option("hoge")
  s: string = optionalS.unsafeGet
  o = none(int)

echo optionalS.typeof
echo s.typeof
echo o.typeof
echo o

proc find(haystack: string, needle: char): Option[int] =
  for i, c in haystack:
    if c == needle:
      return some(i)
  return none(int) # This line is optional, default value is none

let res = "abc".find('d')
echo res.isNone
echo res.isSome
# echo res.get # Error
echo res.get(-1) # with default value