import sequtils, strutils, algorithm
var
    s:seq[char] = toSeq(readLine(stdin).items)
    t:seq[char] = toSeq(readLine(stdin).items)
    lim:int = min(len(s),len(t)) - 1
sort(s,system.cmp[char])
sort(t,system.cmp[char])
reverse(t)
proc main():string =
    for i in 0..lim:
        if s[i] == t[i]:
            if i == lim:
                if len(s) < len(t):
                    return "Yes"
                elif len(s) > len(t):
                    return "No"
                elif len(s) == len(t):
                    return "No"
            continue
        elif s[i] < t[i]:
            return "Yes"
        elif s[i] > t[i]:
            return "No"
echo main()
