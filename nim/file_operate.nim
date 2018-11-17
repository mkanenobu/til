import os, times

var f: File
f = open("sample_file_operate.txt", FileMode.fmWrite)
defer: close(f)
# var f = open("sample_file_operate", FileMode.fmAppend) # 追記
f.writeLine "write1"
f.writeLine "write2"
echo "written"

f = open("sample_file_operate.txt", FileMode.fmRead)
# 一行読みこむ
#try:
#  echo f.readLine()
#finally:
#  close(f)

var
  ctime: Time = getCreationTime("sample_file_operate.txt")
  mtime: Time = getLastModificationTime("sample_file_operate.txt")
  ltime: Time = getLastAccessTime("sample_file_operate.txt")
# readAllテキストファイルをすべて読み込む
#try:
echo f.readAll()
echo "get filesize"
echo f.getFileSize
#echo getFileSize("sample_file_operate.txt")
#echo "sample_file_operate.txt".getFileSize()
echo ctime
echo mtime
echo ltime

# 存在確認
echo os.existsFile("sample_file_operate.txt")

echo "パターンにマッチするファイルを取得する"
for f in walkFiles("/home/mika/Workspace/nim/*.nim"):
  echo f

echo "再帰的にディレクトリを探索"
echo "数が多いので10個まで"
var iTimes: int
for i in walkDirRec("/home/mika/"):
  iTimes += 1
  if iTimes == 10:
    break
  echo i


close(f)
