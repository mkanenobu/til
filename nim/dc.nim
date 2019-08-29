# Forth style reverese Polish calculator, implementation in Nim
import sequtils, strutils, math, strformat
import rdstdin

type
  Stack = seq[float]
  StackUnderflowError = object of Exception

const
  popOperators = ["p", "."]

# 参照渡し
proc calc(stack: var Stack, op: string): bool =
  var tmp: float
  try:
    case op:
      of "+": tmp = stack.pop + stack.pop
      of "*": tmp = stack.pop * stack.pop
      of "-": tmp = stack.pop; tmp = stack.pop - tmp
      of "/": tmp = stack.pop; tmp = stack.pop / tmp
      else: return false
    stack.add(tmp)
    true
  except IndexError:
    raise newException(StackUnderflowError, "stack underflow")

proc stackOperation(stack: var Stack, op: string): bool =
  try:
    if op in popOperators:
      echo stack.pop
      true
    else:
      false
  except IndexError:
    raise newException(StackUnderflowError, "stack underflow")

proc prettyPrint(s: Stack) =
  let pp = s.mapIt(
    if it mod 1.0 == 0.0:
      $int(it)
    else:
      fmt"{it}"
  )
  echo "[" & pp.join(", ") & "]"

proc main() =
  var
    stack: Stack = @[]
    edited: bool
    line: seq[string]

  while true:
    line = readLineFromStdin("> ").split.filterIt(it != "")

    for atom in line:
      try:
        edited = stack.calc(atom) or stack.stackOperation(atom)
        if not edited:
          stack.add(atom.parseFloat)
      except StackUnderflowError:
        echo "Stack underflow!"
      except ValueError:
        echo "Invalid chars!"
        stack = @[]
    prettyPrint stack

try:
  main()
except IOError:
  echo "***Exit***"
  quit 0
