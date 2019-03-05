import nre, strutils, sequtils

func rot13(s: string): string =
  for c in s:
    var ch = toLowerAscii(c)
    if ch in {'a'..'m'}:
      result &= chr(ord(c) + 13)
    elif ch in {'n'..'z'}:
      result &= chr(ord(c) - 13)
    else:
      result &= c

