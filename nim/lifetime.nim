import sequtils, strutils, os, terminal

const
  Birth = ""

var
  width = terminalWidth()
  cr = proc() = stdout.write('\r')

stdout.write(width)
