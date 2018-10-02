import sequtils, strutils, algorithm, math

var a:int = 0
try:
  a = readLine(stdin).parseInt
  echo "all green"
except OverflowError:
  echo "overflow"
except ValueError:
  echo "could not convert string to int"
except IOError:
  echo "IO error"
except:
  echo "Unkown error"
  raise
finally:
  echo a

try:
  var b = parseInt("abc")
except:
  let
    e = getCurrentException()
    msg = getCurrentExceptionMsg()
  echo "Got exception ", repr(e), " with message ", msg
