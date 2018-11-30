import math, sequtils, strutils

type
  Decimal = tuple[integer: seq[int], decimal: seq[int]]
  BCD = tuple[integer: seq[string], decimal: seq[string]]

proc toBCD*(floatString: string): BCD =
  ## Float to BCD
  ##
  ##
  var
    mpInt, tmpDec: string
    resInt: seq[string] = @[]
    resDec: seq[string] = @[]
    (tmpInt, tmpDec) = floatString.split('.')
    for i in tmpInt:
      resInt.add(toBin(parseInt($i), 4))
    for i in tmpDec:
      resDec.add(toBin(parseInt($i), 4))
    return (resInt, resDec)
 
proc BcdToFloat*(d: BCD): float =
  ## Decimal to float
  ##
  ## raise Overflow Error
  var
    tmpInt = d.integer
    tmpDec = d.decimal
    res: string = ""
  for i in tmpInt:
    res &= parseBinInt(i)
  if tmpDec.len != 0:
    res &= '.'
  for i in tmpDec:
    res &= parseBinInt(i)
  return parseFloat(res)
