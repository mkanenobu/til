import os

let 
    args = commandLineParams()
    apLimit = 139

var
    lenArgs = args.len
    count: int

if lenArgs > 2:
    discard
elif lenArgs == 2:
    if # 配列,argsのひとつ目 >= ふたつ目:
        discard
    var count = # ふたつ目
elif lenArgs == 1:
    var count = (#引数 // 40 + 1 ) * 40
else:
    discard

if count >= apLimit
