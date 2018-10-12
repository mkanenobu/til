import sequtils, strutils, os, times
proc indexError() =
    echo "command [NOW] [FULL]"
    quit 1
if commandLineParams().len > 2:
    echo "Too many args"
    indexError()
elif commandLineParams().len == 0:
    echo "Input args"
    indexError()
var
    input = commandLineParams().map(parseInt)
    nowStamina:int = input[0]
    fullStamina:int = input[1]
    remainStamina:int = fullStamina - nowStamina
    nowTime = local(getTime())#.format("HH:mm:ss")
    fullTime:string
    remainHours:int
    remainMinutes:int = (fullStamina - nowStamina) * 5
#echo (nowTime + 10.minutes).format("HH:mm:ss")
fullTime = (nowTime + remainMinutes.minutes).format("HH:mm:ss")
remainHours = remainMinutes div 60
remainMinutes = remainMinutes mod 60

echo remainStamina
if remainHours == 0:
    echo "Remain ", remainMinutes, " minutes"
else:
    echo "Remain ", remainHours, " hours ", remainMinutes, "minutes"
echo fullTime
