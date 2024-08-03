import std/[os, strutils]
import "./stack.nim"
import "./parse.nim"
import "./eval.nim"

proc startRepl*() =
  let s = newStack[int]()

  while true:
    stdout.write("> ")
    stdout.flushFile()

    var buf: string
    if not stdin.readLine(buf):
      break
    
    buf = buf.strip()
    if buf.len() == 0:
      continue

    let tokens = parseLine(buf)
    for t in tokens:
      eval(t, s)
    echo s.data

