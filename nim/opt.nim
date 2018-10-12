import parseopt2
var
    filename:string
    p = initOptParser("--left --debug:3 -l=4 -r:2")
proc writeHelp() = discard
proc writeVersion() = discard
for kind, key, val in p.getopt():
  case kind
  of cmdArgument:
    filename = key
  of cmdLongOption, cmdShortOption:
    case key
    of "help", "h": writeHelp()
    of "version", "v": writeVersion()
  of cmdEnd: assert(false) # cannot happen
if filename == "":
  # no filename has been given, so we show the help:
  writeHelp()
