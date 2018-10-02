from strutils import split, parseInt
from sequtils import map

var
    input = readLine(stdin).split(" ") # 標準入力をスペースでスプリット,numはseq型
    num: seq[int] = input.map(parseInt) # numの要素をintに

proc mapAdd():int =
    for i, value in num:
        if i == num.len:
            return result
        result = result + value

echo mapAdd()
