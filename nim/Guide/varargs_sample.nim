import strutils
# varargsは可変長引数に使う
# また引数を受け取る際，任意の変換処理を行うことができる
var
    s:string = ""
    num = 0
proc toInt(x:string):int =
    return parseInt(x)
proc echoArgs(a:varargs[int, toInt]):int =
    # @を付けることでseqに変換可能
    for i in a:
        num += i
    return num

echo echoArgs(1,2,"3",4,"5")

proc echoArgs2(b:varargs[string, `$`]):string =
    for i in b:
        s.add(i)
    return s

echo echoArgs2("Hello",123)
