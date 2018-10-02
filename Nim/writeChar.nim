import algorithm,unicode,random,os, ospaths
import math, bigints, strutils, sequtils
var
    a = @["Hello","World","!"]
    b:seq[int] = @[]
    c:seq[char] = @['S','t','r','i','n','g']
    e:seq[char] = @[]
    d = ""
    ja:seq[Rune] = "こんにちは".toRunes
for j in 'a'..'z':
    e.add(j)
for i in 0..<e.len:
    discard stdout.writeChars(e, 0, e.len)#c.len)
