import sequtils, strutils, algorithm, math

var
  input = readLine(stdin).split
  a: SomeNumber = parseFloat(input[0])
  b: SomeNumber = parseFloat(input[2])
  operater: char = input[1][0]
  #e: ref 

proc main():float =
  case operater
  of '+': return a + b
  of '-': return a - b
  of '*': return a * b
  of '/': return a / b
  else: echo "Invalid input"

echo main()
