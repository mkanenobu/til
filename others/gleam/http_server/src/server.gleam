import gleam/erlang/process
import gleam/http/response
import gleam/http
import mist
import gleam/bytes_builder
import gleam/http/request.{type Request}
import handler
import gleam/io

pub fn run_server() {
  let not_found =
    response.new(404)
    |> response.set_body(mist.Bytes(bytes_builder.new()))

  let assert Ok(_) =
    fn(req: Request(mist.Connection)) -> response.Response(mist.ResponseData) {
      request_log(req) |> io.println
      case request.path_segments(req) {
        ["echo"] -> handler.handler(req)
        _ -> not_found
      }
    }
    |> mist.new
    |> mist.port(8888)
    |> mist.start_http

  process.sleep_forever()
}

fn request_log(req: Request(mist.Connection)) -> String {
  let msg = "Request: "
  let msg = msg <> http.method_to_string(req.method)
  let msg = msg <> " "
  let msg = msg <> req.path
  msg
}