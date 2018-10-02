import strutils

var
    a = readLine(stdin).parseInt
    hours = a div 100
    minutes = $((a mod 100) * 6 div 10)
if minutes.len == 1:
    minutes = "0" & minutes

echo 10 + hours, ":", minutes
