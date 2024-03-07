import gleam/io
import gleam/int
import gleam/result

pub fn results_example() {
  // gleamは例外機構を持たず組み込みのResult型を使う
  // ResultはResult(T, E)という形で、Tは成功時の値、Eはエラー時の値
  // 成功のバリアントはOkで、エラーのバリアントはError
  buy_pie(5)
  |> io.debug

  buy_pie(10)
  |> io.debug

  buy_pie(4)
  |> io.debug

  // Resultのコールバックヘルを避けるためにuse式を使う
  without_use()
  |> io.debug
  with_use()
  |> io.debug

  Nil
}

pub type PurchaseError {
  NotEnoughMoney(required: Int)
  NotLuckyEnough
}

fn buy_pie(money: Int) -> Result(Int, PurchaseError) {
  case money >= 5 {
    True ->
      case int.random(4) == 0 {
        // 確率でLuckが足りないエラーを返す
        True -> Error(NotLuckyEnough)
        False -> Ok(money - 5)
      }
    // 残金が足りないエラーを返す
    False -> Error(NotEnoughMoney(required: 5))
  }
}

fn without_use() {
  result.try(get_username(), fn(username) {
    result.try(get_password(), fn(password) {
      result.map(login(username, password), fn(message) {
        message <> ", " <> username
      })
    })
  })
}

fn with_use() {
  // useはresult.tryのコードを簡潔にする式
  // （Rustの?演算子に似ている）

  // useは関数呼び出しと無名関数のシンタックスシュガーである
  let _ =
    "
  use username <- result.try(get_username())
  do_something(username)
  "
  // は
  let _ =
    "
  result.try(get_username(), fn(username) {
    do_something(username)
  })
  "
  // として展開される

  use username <- result.try(get_username())
  io.debug("username: " <> username)
  // エラーになるとその時点でその関数の評価値がそのエラーになり、それ以降の式は評価されない
  use password <- result.try(get_password())
  io.debug("password: " <> password)
  use message <- result.map(login(username, password))
  message <> ", " <> username
}

fn get_username() {
  Ok("gleam")
}

fn get_password() {
  let n = int.random(2)
  case n == 0 {
    True -> Error("password error")
    False -> Ok("password")
  }
}

fn login(_username: String, _password: String) {
  Ok("logged in")
}
