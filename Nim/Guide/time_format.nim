import strutils, times

let
    #t:string = readLine(stdin)
    t = "08:10"
    time:DateTime = parse(t, "HH:mm")

echo format(time + 5.minutes, "HH:mm")
