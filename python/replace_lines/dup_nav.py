#!/usr/bin/env python3
import re
import os
import sys

index_nav = []

fRead = open("index.html")
lines = fRead.readlines()
fRead.close()

# nav menuの箇所のみ読み込み，リスト化
for line in lines:
    if line.find("<li>") >= 0:
        index_nav.append(line)

def replace_nav(writeFile):
    i = 0
    newLines = []
    # 置き換え先ファイルの読み込み
    fWrite = open(writeFile)
    wLines = fWrite.readlines()
    fWrite.close()

    for wLine in wLines:
        if wLine.find("<li>") >= 0:
            newLines.append(index_nav[i])
            i += 1
        else:
            newLines.append(wLine)

    # newLinesを書き込み
    fWrite = open(writeFile, 'w')
    fWrite.writelines(newLines)
    fWrite.close()

if len(sys.argv) == 0:
    print("index.html内のnav要素を引数のnav要素にコピーします。")
    print("コピー先のファイルを入力してください。")
else:
    for i in sys.argv[1:]:
        replace_nav(i)
    print("Done!")
