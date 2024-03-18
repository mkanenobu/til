import gleam/http/response.{type Response}
import gleam/http/request.{type Request}
import gleam/bytes_builder
import mist.{type Connection, type ResponseData}

pub fn handler(_req: Request(Connection)) -> Response(ResponseData) {
  response.new(200)
  |> response.set_body(mist.Bytes(
    "Hello, World!"
    |> bytes_builder.from_string,
  ))
  |> response.set_header("content-type", "text/plain")
}
