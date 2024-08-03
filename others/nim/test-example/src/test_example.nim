from "./mod.nim" import greet

when isMainModule:
  echo greet("World")
