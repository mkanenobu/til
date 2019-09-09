import sequtils, strutils, algorithm, math
import sets
import filename

var
  res = filepath.readFile.split('\n').mapIt(it.split('\t')[0]).filterIt(it != "").toHashSet

echo res
