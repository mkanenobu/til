import os, sequtils, parseopt
#var
#    s:string = "Hello, World!"
#    file = commandLineParams()[0]
#    f:File = open(file, FileMode.fmRead)
##while not endOfFile(f):
##for i in readAll(f):
#    #echo readLine(f)
#echo readAll(f)
#
#f.close

for i in 1..1000:
    flushFile(stdout)
    write(stdout, "\r" & $i)
    sleep 50
