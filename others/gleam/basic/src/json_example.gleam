import gleam/io
import gleam/json
import gleam/dynamic

pub type Struct {
  Struct(b: Bool, i: Int, s: String, f: Float, l: List(Int))
}

pub fn json_example() {
  let struct = Struct(b: True, i: 1, s: "string", f: 1.0, l: [1, 2, 3])
  let encoded = encode(struct)
  io.debug(encoded)

  let decoded = decode(encoded)
  io.debug(decoded)

  Nil
}

fn encode(struct: Struct) -> String {
  json.object([
    #("b", json.bool(struct.b)),
    #("i", json.int(struct.i)),
    #("s", json.string(struct.s)),
    #("f", json.float(struct.f)),
    #("l", json.array(struct.l, of: json.int)),
    #("n", json.null()),
  ])
  |> json.to_string
}

fn decode(json_str: String) -> Result(Struct, json.DecodeError) {
  let decoder =
    dynamic.decode5(
      Struct,
      dynamic.field("b", of: dynamic.bool),
      dynamic.field("i", of: dynamic.int),
      dynamic.field("s", of: dynamic.string),
      dynamic.field("f", of: dynamic.float),
      dynamic.field("l", of: dynamic.list(dynamic.int)),
    )

  json.decode(from: json_str, using: decoder)
}
