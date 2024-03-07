import gleam/io

pub fn nil_example() {
  // Nilはgleamのユニット型
  // 全ての関数がなんらかの型を返す必要があるので、何も返さない関数の返却値として返すもの
  // Nilは他の型の値として有効ではない、つまり値の型がNilの場合には値はNilで他の型の場合には値はNilではない

  let r = io.println("nil example")
  io.debug(r == Nil)
}
