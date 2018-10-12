import strutils,sequtils
echo r"Input 'Hello!'"
var a:string = readLine(stdin)
block block1:
    case a
    of "Hello":
        echo "Ok"
    of "Hello!":
        echo "Very good!"
    else:
        echo r"Input 'Hello!'"

echo "Input number"
let n = readLine(stdin).parseInt
block:
    case n
    of 0..2, 4..7: echo "入力した数値は以下の集合に属しています: {0,1,2,4,5,6,7}"
    of 3, 8: echo "入力した数値は3か8です"
    else: discard
