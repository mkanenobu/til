import jester, json, htmlgen
import sequtils, strutils

# jester hands on
routes:
  get "/":
    resp $(%*{"response": "Hello, World!"}), "application/json"
  get "/200":
    resp Http200, html(h1("status 200, OK"))
  get "/500":
    resp Http500, html(h1("status 500, Internal Server Error"))
  get "/404":
    resp Http404, html(h1("status 404, Not Found"))
  get "/504":
    resp Http504, html(h1("status 504, Gateway Timeout"))
  get "/204":
    # no contents
    resp Http204
  get "408":
    resp Http408, html(h1("status 408, Request Timeout"))
  get "/user/@id":
    var data = %*{"id": @"id"}
    resp $data, "application/json"
  get "/echoback/@input":
    resp $(%*{"input": @"input"}), "application/json"

runForever()

