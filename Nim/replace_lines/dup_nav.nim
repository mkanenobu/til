import os, sequtils, strutils, nre, options

# Copy index's nav to other file(args)

let args: seq[TaintedString] = commandLineParams()

if args.len == 0:
  quit("Input args")
for test in args:
  if not(os.existsFile(test)):
    quit("File is not found")

proc rewrite_menu(files: TaintedString) =
  var
    #files = stdin.readLine
    f_read = open("./index.html", FileMode.fmRead)
    f_write = open(files, FileMode.fmRead)
    readSeq: seq[string] = @[]
    writeSeq: seq[string] = @[]

  while f_read.endOfFile == false:
    var line = 0
    readSeq.add(f_read.readLine())
    #f_write.writeLine(readSeq[line])
    #echo file2seqence[i]
    line += 1

  while f_write.endOfFile == false:
    var line = 0
    writeSeq.add(f_write.readLine())
    line += 1

  close f_write

  var f_write2 = open(files, FileMode.fmWrite)

  for i in 0..min(writeSeq.len-1, readSeq.len-1):
    if i > 14 and i < 20:
      f_write2.writeLine(readSeq[i])
    else:
      f_write2.writeLine(writeSeq[i])

  close f_write2
  close f_read

for times in 0..(len(args)-1):
  rewrite_menu(args[times])
