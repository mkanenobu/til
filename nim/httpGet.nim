import httpclient, os, strformat

if paramCount() == 0:
  quit 1

var
  url = paramStr(1)
  client = newHttpClient()

echo client.getContent(fmt"{url}")
