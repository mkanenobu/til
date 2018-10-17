import sequtils,strutils,tables
import sets
var
  # arrayは静的配列
  arr:array[5,int] = [1,2,3,4,5]
  # seqは動的配列
  seqInt:seq[int] = @[1,1,2,2,3,4,5]

  # seq[int] to seq[string]
  seqString:seq[string] = seqInt.mapIt($it)

  str = "string"
  # set
  set1 = {1,6,8,12,55,0,3}
  # table
  b = @[54,3,21,8,12,100]
  a = newCountTable[int]()

# string to seq[char]
var seqChar = str.mapIt(char, it)

# table
for i,v in b:
  a[i] = b[i]

echo largest(a)

# setから要素の削除
excl(set1, 55)
echo set1

delete(seqString,1)


# 要素のカウント
echo count(seqInt, 1)
# 重複削除
echo seqInt.deduplicate()

# pairsイテレーター
for key, val in pairs(seqInt):
  echo key,val

# openarrayは配列を汎用的に扱う型
# arrayとseq両方で使える関数を作ったりするのに使える
proc echoHead(arr:openarray[int]) =
  echo arr[0]

echoHead([1,2,3])
echoHead(@[1,2,3])

# Slice to Seq
echo toSeq(0..10)

# unique array
var d = toSet(seqInt)
echo d.len
