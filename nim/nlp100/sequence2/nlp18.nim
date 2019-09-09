import sequtils, strutils, algorithm, math
import filename

var
  lines: seq[string] = filepath.readFile.split('\n').filterIt(it != "")

lines = lines.sortedByIt(it.split('\t')[2].parseFloat).reversed
echo lines.join("\n")

