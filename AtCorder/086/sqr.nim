import strutils
var a:int = readLine(stdin).replace(" ","").parseInt
proc sq():string =
    for i in 1..317:
        if a == i * i:
            return "Yes"
    return "No"
echo sq()
