import sequtils, strutils, algorithm, math

var n = readLine(stdin).parseInt

proc main():string =
  for i in 0..25:
    if n < 4 * i:
      return "No"
    elif (n - (4 * i)) mod 7 == 0:
      return "Yes"
  return "No"

echo main()
