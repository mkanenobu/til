import std/options
import "./stack.nim"
import "./parse.nim"

proc eval*(token: Token, s: Stack[int]) =
  case token.kind
  of TokenKind.Int:
    s.push(token.value)
  of TokenKind.Op:
    var
      b = s.pop()
      a = s.pop()

    if a.isNone() or b.isNone():
      return

    var
      a2 = a.get()
      b2 = b.get()

    case token.op
    of Operator.Plus:
      s.push(a2 + b2)
    of Operator.Minus:
      s.push(a2 - b2)
    of Operator.Multiple:
      s.push(a2 * b2)
    of Operator.Divide:
      s.push(int(a2 / b2))
