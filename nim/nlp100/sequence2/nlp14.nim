import sequtils, os, strutils
import filename

var res = filepath.readLines(parseInt(commandLineParams()[0]))
echo res.join("\n")
