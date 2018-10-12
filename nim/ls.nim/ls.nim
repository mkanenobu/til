import terminal, os, ospaths, strutils, sequtils
import re, options, algorithm, parseopt2
system.addQuitProc(resetAttributes)
var
  target_dirs:seq[string] = @[]
  target:string
  opts:seq[string] = @[]

proc ls() =
  for kind, key, val in getopt():
    case kind
    of cmdArgument:
      target_dirs.add(key)
    of cmdLongOption, cmdShortOption:
      if key == "a": opts.add("a")
    else: discard
# if no args
  if len(target_dirs) == 0:
    target_dirs.add("./")
  #if opts.contains("a"):
# ls -a
  #  target_dirs = concat(target_dirs, map(target_dirs,proc(x:string):string = x & r"."))
  for target_dir in target_dirs:
    if existsDir(target_dir):

      if not (toSeq(target_dir.items)[target_dir.len - 1] == '/'):
        if opts.contains("a"):
          target = target_dir & "/.*"
        else:
          target = target_dir & "/*"
      else:
        if opts.contains("a"):
          target = target_dir & ".*"
        else:
          target = target_dir & "*"
    else: target = target_dir

    for i in walkPattern(target):
      var fileInfo = getFileInfo(i)
      setStyle({styleBright})
# dir
      if fileInfo.kind == pcDir:
        setForegroundColor(fgBlue)
# link
      elif fileInfo.kind == pcLinkToDir or fileInfo.kind == pcLinkToFile:
        setForegroundColor(fgCyan)
# media file
      elif i.contains(re"(\.wav|\.opus|\.png|\.jpg)"):
        setForegroundColor(fgMagenta)
# excutable
      elif (fileInfo.permissions).contains(fpUserExec):
        setForegroundColor(fgGreen)
      else:
        resetAttributes(stdout)
      echo(i.splitPath.tail)

ls()
