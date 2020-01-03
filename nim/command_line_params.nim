import os

let
    programName: string = getAppFilename()
    arguments:seq[string] = commandLineParams()
# 引数がないとき
if paramCount() == 0:
    programResult = 1
else:
    echo arguments[1]
    echo programName
    programResult = 0

echo paramStr(0)
echo paramStr(1)
#    input: TaintedString = readLine(stdin)
#echo programName, ", ", arguments,", ",input
#echo len(arguments)
