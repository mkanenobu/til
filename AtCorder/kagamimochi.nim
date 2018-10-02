import algorithm,sequtils,strutils
var
    n = readLine(stdin).parseInt
    mochi:seq[int] = @[]
for i in 0..<n:
    mochi.add(readLine(stdin).parseInt)
sort(mochi, system.cmp[int])
reverse(mochi)
proc kagamiMochi():int =
    result = 1
    for i in 0..<(len(mochi) - 1):
        if mochi[i] != mochi[i + 1]:
            result = result + 1
echo kagamiMochi()
