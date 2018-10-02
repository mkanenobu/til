import os,sequtils,strutils,parseopt

let
    programName: string = getAppFilename()
    arguments:seq[string] = commandLineParams()
# 引数がないとき
if paramCount() == 0:
    system.programResult = 1
else:
    echo arguments[1]
    echo programName
    system.programResult = 0

#    input: TaintedString = readLine(stdin)
#echo programName, ", ", arguments,", ",input
#echo len(arguments)
