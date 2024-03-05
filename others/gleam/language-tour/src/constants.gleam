import gleam/io

// 定数はリテラルである必要があり、定義に関数を使うことは出来ない
const ints = [1, 2, 3]

const floats = [1.0, 2.0, 3.0]

pub fn constants() {
  io.println("Constants example")

  // 定数を使うと効率的になる可能性があるが、ランタイムに依る
  io.debug(ints)
  io.debug(floats)
}
