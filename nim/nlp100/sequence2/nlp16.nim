import sequtils, strutils, os
import filename

var
  lines = filepath.readFile.split('\n')
  n = parseInt(commandLineParams()[0])

echo lines.distribute(n)
