import sequtils, strutils, sets

var
    n = readLine(stdin).parseInt
    a = newSeq[string](n)
    b = newSeq[string](n)
    c = newSeq[string](n)
    d = newSeq[string](n)
    r = newSeq[string](n)
    nots:seq[seq[int]] = @[]
    guess:seq[seq[int]] = @[]
    ans = initSet[int]()

for i in 0..9:
    ans.incl(i)

for i in 0..<n:
    (a[i],b[i],c[i],d[i],r[i]) = (readLine(stdin).split)

for j in 0..<n:
    if r[j] == "NO":
        nots.add(@[a[j], b[j], c[j], d[j]].map(parseInt))
    elif r[j] == "YES":
        guess.add(@[a[j], b[j], c[j], d[j]].map(parseInt))

proc main() =
    var yes,no:int
    for i in 0..<n:
        if r[i] == "YES":
            for j in 0..9:
                if not contains(guess[yes], j):
                    ans.excl(j)
            yes += 1
        elif r[i] == "NO":
            for j in 0..9:
                if contains(nots[no], j):
                    ans.excl(j)
            no += 1
    for i in ans:
        echo i

main()
