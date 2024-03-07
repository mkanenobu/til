import gleam/io

pub fn externals() {
  now()
  |> io.debug

  reverse_list([1, 2, 3])
  |> io.debug

  Nil
}

pub type DateTime

// 同じ関数に対して複数の外部実装を指定することができ、gleam.tomlのtargetで指定したターゲットによって適切な実装が利用される
// 基本的には全てのターゲットで利用可能な実装を指定することが望ましいが、不可能なこともあるのでドキュメントで補足するのがよい
@external(erlang, "calendar", "local_time")
@external(javascript, "./ffi.mjs", "now")
pub fn now() -> DateTime

// 外部実装を指定しつつ、gleam実装を行うことも出来る
// targetで外部実装が利用可能であればそちらが利用され、利用不可能であればgleam実装が利用される
// この場合、erlangランタイムだとerlang実装が利用され、それ以外だとgleam実装が利用される
@external(erlang, "lists", "reverse")
pub fn reverse_list(items: List(e)) -> List(e) {
  tail_recursive_reverse(items, [])
}

fn tail_recursive_reverse(items: List(e), reversed: List(e)) -> List(e) {
  case items {
    [] -> reversed
    [first, ..rest] -> tail_recursive_reverse(rest, [first, ..reversed])
  }
}
