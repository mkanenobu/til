import gleam/io
import gleam/int
import gleam/list

pub fn case_expression() {
  io.println("Case expression")

  let x = int.random(5)
  io.debug(x)

  // パターンマッチング可能なcase式
  // 全網羅していないとコンパイルが通らない
  let result = case x {
    0 -> "Zero"
    1 -> "One"
    // プレースホルダー
    _ -> "Other"
  }
  io.debug(result)

  // variable pattern
  let x = int.random(5)
  io.debug(x)
  let result = case x {
    0  -> "Zero"
    1 -> "One"
    v -> "It is " <> int.to_string(v)
  }
  io.debug(result)

  // string pattern
  get_name("Hello, John") |> io.debug
  get_name("Hello, Mike") |> io.debug
  get_name("Test") |> io.debug

  // list pattern
  let x = list.repeat(int.random(5), times: int.random(3))
  io.debug(x)
  list_match(x) |> io.debug
}

// string pattern
// 特定のプレフィックスを持つ文字列でマッチング出来る
fn get_name(x: String) -> String {
  case x {
    "Hello, " <> name -> name
    _ -> "Unknown"
  }
}

// list pattern
fn list_match(l: List(Int)) -> String {
  case l {
    [] -> "Empty List"
    [1] -> "List of just 1"
    // 上から順にマッチングされるので [4, 1] というリストが渡された場合、"List of 2 elements" の方ではなくこれにマッチする
    [4, ..] -> "List starts with 4"
    [_, _] -> "List of 2 elements"
    _ -> "Some other list"
  }
}