import strutils, times

let
    t:string = readLine(stdin)
    time = parse(t, "HH:mm")

echo format(time + 5.minutes, "HH:mm")
