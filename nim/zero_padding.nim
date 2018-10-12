import strformat, strutils, math, os
var
  n = 12
  s = "5"
# int型
echo fmt"{n:<04}"

# string型の場合parseIntする
# doAssert "{s.parseInt:03}" == "005"
# echo fmt"{s.align(5, '0')}test"
echo s.align(5, '0')
# var e: ref OSError
# new(e)
# e.msg = "error"
# raise e

