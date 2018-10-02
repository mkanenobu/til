import httpclient, json, strformat
const
    event_name = "shell_notify"
    key = "Uv9NleZiZbGBYMrIX2_1z"
    #key = "your_key"
    URL:string = fmt"https://maker.ifttt.com/trigger/{event_name}/with/key/{key}"

let client = newHttpClient()
client.headers = newHttpHeaders({ "Content-Type": "application/json" })
let body = %*{
    "value1": "test text"
}
let response = client.request(URL, httpMethod = HttpPost, body = $body)
echo response.status
