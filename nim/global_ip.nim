import httpclient, os

var client = newHttpClient()

echo client.getContent("http://ipinfo.io/ip")
