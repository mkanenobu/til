import sequtils, strutils, algorithm, math
import os

var
  a = "string"
  s = mapIt(0..<len(a), a[it] & $it)


echo absolutePath("a")
