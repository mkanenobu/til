import jester, json
import sequtils, strutils

# jester hands on
routes:
  get "/":
    resp "Hello, World!"
  get "/user/@id":
    var data = %*{"id": @"id"}
    resp $data, "application/json"
  get "/echoback/@input":
    resp $(%*{"input": @"input"}), "application/json"

runForever()

