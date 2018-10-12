import strutils, strformat
echo "hello world     ".strip() # 先頭と終わりの半角空白を取り除く
echo "hello world".len() # 文字列の長さ
echo "hello world".split(' ') # 文字列を空白で分割
echo(@["hello", "world"].join(" ")) # 文字列連結
echo "hello world"[0] # n番目の文字
echo "hello world"[2..7] # 部分文字列
echo "hello world".replace("hello", "hola") # 文字列置換
echo "$1 eats $2." % ["The cat", "fish"]
echo "hello " & "world" # 文字列連結
echo 'F' # char型
echo r"C:\program files\nim" # raw文字列
stdout.write("Hello") # 改行なし

let s = "Hello"
echo fmt"s is {s}"

echo align(s, 7) #-> "  Hello"
echo align(s, 3) #-> "Hello"
echo align(s, 8, '#') #-> "###Hello"
echo alignLeft(s, 7) #-> "Hello  "
echo alignLeft(s, 6, '$') #-> "Hello$"
