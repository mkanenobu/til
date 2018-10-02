import sequtils, strutils, algorithm, math, strformat

for i in 0..999:
  echo fmt"{i:03}"
  flushFile(stdout)
  if readLine(stdin) == "unlocked":
    quit()
