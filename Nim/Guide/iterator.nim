iterator myCountUp(a,b:int):int =
    var res = a
    while res <= b:
        yield res
        inc(res)

for i in myCountUp(1,7):
    echo i
