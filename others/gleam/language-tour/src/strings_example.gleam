import gleam/io
import gleam/string

pub fn strings_example() {
  io.println("Strings example")

  io.debug("Unicodeキャラクターが使える")
  io.debug(
    "
  Multi
  line
  String
  ",
  )
  io.debug("\u{1F600}")

  // クォート
  io.println("\"X\" marks the spot")
  // 文字列連結
  io.debug("One " <> "Two")

  string.reverse("1 2 3 4 5")
  |> io.debug
  string.append("abc", "def")
  |> io.debug
}
