import os, sequtils, strutils, times, parseopt
import system, strformat

# Depends on "ruby-notify"
var
    set_time:int
    display_time:string
    remain_minutes, remain_seconds, remain_hours:string
    keys:seq[string] = @[]
    sound:string

for kind, key, val in getopt():
    case kind
    of cmdArgument:
        set_time = parseInt(key) * 60
    of cmdLongOption, cmdShortOption:
        keys.add(key)
    of cmdEnd: discard
    else: discard

for options in keys:
    case options
    of "s", "second":
        set_time = int(toFloat(set_time) / 60)
    of "h", "hour":
        set_time *= 3600
    of "m", "minute": #Default
        set_time = set_time
    else:
        set_time = set_time

proc timer() =
    for i in countdown(set_time, 0):
        remain_seconds = $(i mod 60)
        remain_minutes = $((i mod 3600) div 60)
        remain_hours = $(i div 3600)
        if len($remain_seconds) == 1:
            remain_seconds = "0" & remain_seconds
        if len($remain_minutes) == 1:
            remain_minutes = "0" & remain_minutes
        if len($remain_hours) == 1:
            remain_hours = "0" & remain_hours
        display_time = fmt"{remain_hours}:{remain_minutes}:{remain_seconds}"
        flushFile(stdout)
        stdout.write("\r" & "          ")
        stdout.write("\r" & display_time)
        sleep 1000
    discard execShellCmd(fmt"notify 'Time has come'")
    echo "\a"

timer()
