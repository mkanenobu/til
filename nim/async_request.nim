import asyncdispatch, httpclient

# 非同期なAPIの戻り値は Future[T]
proc fetchGoogle(): Future[AsyncResponse] =
  var client = newAsyncHttpClient()
  let res = client.request("http://www.google.com")
  client.close()
  return res

proc fetchYahoo(): Future[AsyncResponse] =
  var client = newAsyncHttpClient()
  let res = client.request("http://www.yahoo.com")
  client.close()
  return res

proc main() {.async.} =
  var client = newAsyncHttpClient()

  # await はFutureを剥がす構文
  let resYahoo = await fetchYahoo()
  echo resYahoo.status
  client.close()

  let resGoogle = fetchGoogle().waitFor
  echo resGoogle.status

echo "Before"
# waitFor は非同期処理が終わるまでスレッドをブロック(内部実装的にはFutureが完了状態になるまでポーリングし続ける)
# Future[T] -> T
# await は async プラグマがないと使用できない
waitFor main()
echo "After"
