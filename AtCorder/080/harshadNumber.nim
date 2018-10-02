import strutils
let n:string = readLine(stdin)
var
    sum:int
for i in n:
    sum = sum + parseInt($i)
if parseInt(n) mod sum == 0:
    echo "Yes"
else:
    echo "No"
