import asyncdispatch, jester
import std/jsonutils
import models/[user]
import dotenv

load()

router myrouter:
  get "/":
    resp "It's alive!"
  get "/users":
    resp getAllUsers().toJson
  get "/users/@id":
    resp getUser(@"id").toJson

proc main() =
  let port = Port(3000)
  let settings = newSettings(port=port)
  var jester = initJester(myrouter, settings=settings)
  jester.serve()

when isMainModule:
  main()
