import strutils
let
    n:int = readLine(stdin).parseInt
    a:int = readLine(stdin).parseInt
if n mod 500 <= a: echo "Yes"
else: echo "No"
