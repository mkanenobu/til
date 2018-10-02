import osproc,os, sequtils, sets, math
# import random

# randomize()

var
    s = "こんにちは"
    hello_world = "hello_world"
    d:seq[int] = @[]
    t = @[1,2,3,4,5,6,7,8,9]
echo pow(2.0, 2)
t = t.map(proc(x:int):int =
    if x mod 2 == 0: x
    else: x div 2)
echo t


#system.programResult = execCmd("pbcopy << 'EOS'\n" & s)
#if helloWorld == readLine(stdin):
#    echo "Match"
#else:
#    echo "Not match"
echo t[0..0]
