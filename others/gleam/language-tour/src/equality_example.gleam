import gleam/io

pub fn equality_example() {
  io.println("Equality Example")

  // 両辺が同じ型である必要がある
  // ==は同じメモリ位置にあるかではなくstructurallyなチェックを行う
  io.debug(1 == 1)
  io.debug(1.0 == 1.0)
  io.debug(1.0 != 1.0)
  io.debug(True != False)
  io.debug(True == True)
}
