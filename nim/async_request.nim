import asyncdispatch, httpclient

proc main() {.async.} =
  var client = newAsyncHttpClient()
  var res = await client.request("http://www.google.com")
  echo res.status

  res = await client.request("http://www.yahoo.com")
  echo res.status

  client.close()

waitFor main()
