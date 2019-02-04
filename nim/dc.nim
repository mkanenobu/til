# Reverese Polish Notation calculator implementation in Haskell
import sequtils, strutils
import rdstdin

var
  line: seq[string]
  stack: seq[float]
  calc_operaters = ["+", "-", "*", "/"]
  operaters = ["p", ".", ".s"]
  tmp: float

while true:
  line = readLineFromStdin("> ").split(" ")

  for i in line:
    try:
      if calc_operaters.contains(i):
        case i:
          of "+": tmp = stack.pop() + stack.pop()
          of "-": tmp = stack.pop() - stack.pop()
          of "*": tmp = stack.pop() * stack.pop()
          of "/": tmp = stack.pop(); tmp = stack.pop() / tmp
        stack.add(tmp)
      elif operaters.contains(i):
        case i:
          of "p": echo stack.pop()
          of ".": echo stack.pop()
          of ".s": echo stack
      else:
        try:
          stack.add(parseFloat(i))
        except:
          echo "Invalid character"
          stack = @[]
    except:
      echo "Stack underflow"

