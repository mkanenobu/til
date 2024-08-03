import std/[strutils, options, strformat]

type
  Operator* = enum
    Multiple = '*',
    Plus = '+',
    Minus = '-',
    Divide = '/'

  TokenKind* = enum Int, Op
  Token* = ref object
    case kind*: TokenKind:
    of Int:
      value*: int
    of Op:
      op*: Operator

proc parseToken(token: string): Option[Token] =
  case token
  of "+":
    return some(Token(kind: TokenKind.Op, op: Operator.Plus))
  of "-":
    return some(Token(kind: TokenKind.Op, op: Operator.Minus))
  of "*":
    return some(Token(kind: TokenKind.Op, op: Operator.Multiple))
  of "/":
    return some(Token(kind: TokenKind.Op, op: Operator.Divide))
  else:
    try:
      return some(Token(kind: TokenKind.Int, value: parseInt(token)))
    except:
      stderr.writeLine(&"Invalid token: \"{token}\"")
      return none(Token)

proc parseLine*(input: string): seq[Token] =
  var tokens: seq[Token] = @[]
  for t in input.splitWhitespace():
    let parsed = parseToken(t)
    if parsed.isSome():
      tokens.add(parsed.get)
  return tokens
