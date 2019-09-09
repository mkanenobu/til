import sequtils, strutils
import filename

let lines = readFile(filepath)

echo lines.splitLines.filterIt(it != "").len
