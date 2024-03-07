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
    0 -> "Zero"
    1 -> "One"
    v -> "It is " <> int.to_string(v)
  }
  io.debug(result)

  // string pattern
  get_name("Hello, John")
  |> io.debug
  get_name("Hello, Mike")
  |> io.debug
  get_name("Test")
  |> io.debug

  // list pattern
  let x = list.repeat(int.random(5), times: int.random(3))
  io.debug(x)
  list_match(x)
  |> io.debug

  multiple_subject()
  alternative_patterns()
  pattern_alias()
  pattern_guard()
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

fn multiple_subject() {
  let x = int.random(5)
  let y = int.random(5)

  // caseは二つ以上の項目を渡すことも出来る
  case x, y {
    0, 0 -> "X and Y are zero"
    0, _ -> "X is zero"
    _, 0 -> "Y is zero"
    _, _ -> "X and Y are not zero"
  }
  |> io.debug
}

fn alternative_patterns() {
  let n = int.random(10)
  io.debug(n)

  // |区切りでパターンを複数指定することが出来る
  // 現状ではalternative patternをネスト出来ないので [1 | 2 | 3] のような書き方は出来ない
  case n {
    2 | 4 | 6 | 8 -> "This number is even"
    1 | 3 | 5 | 7 | 9 -> "This number is odd"
    _ -> "I'm not sure"
  }
  |> io.debug
}

fn pattern_alias() {
  io.debug(get_first_non_empty([[], [1, 2, 3], [4, 5]]))
  io.debug(get_first_non_empty([[1, 2], [3, 4, 5], []]))
  io.debug(get_first_non_empty([[], [], []]))
}

fn get_first_non_empty(lists: List(List(t))) -> List(t) {
  case lists {
    // パターンエイリアス、asでサブパターンをキャプチャ出来る
    [[_, ..] as first, ..] -> first
    [_, ..rest] -> get_first_non_empty(rest)
    [] -> []
  }
}

fn pattern_guard() {
  let numbers = [1, 2, 3, 4, 5]
  io.debug(get_first_larger(numbers, 3))
  // 4
  io.debug(get_first_larger(numbers, 5))
  // 0
}

fn get_first_larger(lists: List(Int), limit: Int) -> Int {
  case lists {
    // パターンのガード、ガード節では限定された演算子しか使えず、関数呼び出しも出来ない
    [first, ..]
      if first > limit
    -> first
    [_, ..rest] -> get_first_larger(rest, limit)
    [] -> 0
  }
}
