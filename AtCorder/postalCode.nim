import sequtils, strutils
var
    ab:seq[int] = readLine(stdin).split(" ").map(parseInt)
    s:string= $(readLine(stdin))
proc main():string =
    var S = s.split("-")
    if not(s[ab[0]] == '-') or not(len(s) == (ab[0] + ab[1] + 1)):
        return "No"
    elif isDigit(S[0]) and S[0].len == ab[0] and isDigit(S[1]) and S[1].len == ab[1]:
        return "Yes"
    else:
        return "No"
echo main()
