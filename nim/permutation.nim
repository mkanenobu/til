import  sequtils, strutils, algorithm, math, strformat
import typetraits, os

var
  s = "string"
  list = toSeq(0..10)

while list.nextPermutation:
  stdout.write("")
