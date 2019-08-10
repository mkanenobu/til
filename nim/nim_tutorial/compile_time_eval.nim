import sequtils, strutils

static:
  proc compileTimeProc(): string =
    "****CompileTime****"
  const s = compileTimeProc()
  echo s

echo s
