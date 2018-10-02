import sequtils, strutils, algorithm

let n = readLine(stdin).parseInt
var
    red:seq[seq[int]] = @[]
    blue:seq[seq[int]] = @[]
    passed:seq[int] = @[]

for i in 0..<n:
    red.add(readLine(stdin).split(" ").map(parseInt))

for i in 0..<n:
    blue.add(readLine(stdin).split(" ").map(parseInt))

proc main(): int =
    block main:
        for i in 0..<n:
            for j in 0..<n:
                if j.in(passed):
                    break
                if red[i][0] < blue[j][0] and red[i][1] < blue[j][1]:
                    result += 1
                    passed.add(j)
                    break main

echo main()
