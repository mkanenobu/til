import strutils

let
    s:string = readLine(stdin)
    yuki = "yukicoder"

for i in 0..8:
    if s[i] != yuki[i]:
        echo yuki[i]
