import gleam/io

pub type UserId =
  Int

pub fn type_alias() {
  io.println("Type alias")

  // 型エイリアスはただのエイリアスで、新しい型を作成するわけではない
  let id: UserId = 42
  let id2: Int = 100

  // ==は両辺が同じ型である必要があるが、UserIdとIntは同じ型なので比較可能
  io.debug(id == id2)
}
