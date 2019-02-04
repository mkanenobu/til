# Reverese Polish Notation calculator implementation in Haskell
import sequtils, strutils
import rdstdin

var
  line: seq[string]
  stack: seq[float]
  calc_operaters = ["+", "-", "*", "/"]
  operaters = ["p", ".", ".s"]
  tmp: float

proc stack_ctl(s: var seq[float], n: float) =
  discard s.pop()
  discard s.pop()
  s.add(n)

while true:
  line = readLineFromStdin("> ").split(" ")

  for i in line:
    try:
      if calc_operaters.contains(i):
        case i:
          of "+": tmp = stack[^1] + stack[^2]
          of "-": tmp = stack[^1] - stack[^2]
          of "*": tmp = stack[^1] * stack[^2]
          of "/": tmp = stack[^2] / stack[^1]
        stack_ctl(stack, tmp)
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

