import strutils

let
    s = $readLine(stdin)

proc main():string =
    for i,v in s:
        if i < 2: continue
        if v == 'O' and s[i - 1] == 'O' and s[i - 2] == 'O':
            return "East"
        elif v == 'X' and s[i - 1] == 'X' and s[i - 2] == 'X':
            return "West"
    return "NA"

echo main()
