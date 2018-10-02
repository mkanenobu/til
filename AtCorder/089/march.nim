import sequtils,strutils
var
    n = readLine(stdin).parseInt
    s:seq[string] = @[]
    M:seq[string] = @[]
    A:seq[string] = @[]
    R:seq[string] = @[]
    C:seq[string] = @[]
    H:seq[string] = @[]
for i in 1..n:
    s.add($readLine(stdin))
proc main():int =
    for i in s:
        case i[0]
        of 'M': M.add(i)
        of 'A': A.add(i)
        of 'R': R.add(i)
        of 'C': C.add(i)
        of 'H': H.add(i)
        else: discard
    let
        m = M.len
        a = A.len
        r = R.len
        c = C.len
        h = H.len
    # m1,a1,r2,c1,h0
    return (m * a * r) + (m * a * c) + (m * a * h) + (m * r * c) + (m * r * h) + (m * c * h) + (a * r * c) + (a * r * h) + (a * c * h) + (r * c * h)
    #for i in M:
    #    for j in A:
    #        for k in R: result += 1
    #        for k in C: result += 1
    #        for k in H: result += 1
    #    for j in R:
    #        for k in C: result += 1
    #        for k in H: result += 1
    #    for j in C:
    #        for k in H: result += 1
    #for i in A:
    #    for j in R:
    #        for k in C: result += 1
    #        for k in H: result += 1
    #    for j in C:
    #        for k in H: result += 1
    #for i in R:
    #    for j in C:
    #        for k in H: result += 1

echo main()
