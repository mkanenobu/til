import sequtils, strutils
import parsecsv

var
  col1: seq[string] = "col1.txt".readFile.split("\n")
  col2: seq[string] = "col2.txt".readFile.split("\n")
  result: string

for i in 0..<(col1.len):
  result &= (col1[i] & "\t" & col2[i] & "\n")

echo result
