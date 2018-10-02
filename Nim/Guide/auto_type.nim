import strutils, sequtils

proc test(t:int or string):auto =
    return t
echo test("String")
echo test(13)

