

const buildInfo = "Revision " & staticExec("git rev-parse HEAD") & "\nCompiled on " & staticExec("uname -v")

when compiles(var a = 3 + 4):
  echo "+ operater is available"

