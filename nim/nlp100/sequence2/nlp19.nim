import sequtils, strutils, tables, sets
import filename

var
  prefectures: seq[string] = filepath.readFile.split('\n').filterIt(it != "").mapIt(it.split('\t')[0])
  res = prefectures.toCountTable

res.sort
echo res
