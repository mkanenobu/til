import sequtils, strutils, os
import filename


var
  n: int = parseInt(commandLineParams()[0])
  lines: seq[string] = filepath.readFile.split("\n")

echo lines[n..^1].join("\n")
