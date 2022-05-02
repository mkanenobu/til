import asyncdispatch, jester
import std/jsonutils
import std/options
import models/[user]
import dotenv

load()

router myrouter:
  get "/":
    resp "It's alive!"
  get "/users":
    resp getAllUsers().toJson
  get "/users/@id":
    let user = getUser(@"id")
    if user.isSome:
      resp getUser(@"id").toJson
    else:
      resp Http404

proc main() =
  let port = Port(3000)
  let settings = newSettings(port=port)
  var jester = initJester(myrouter, settings=settings)
  jester.serve()

when isMainModule:
  main()
