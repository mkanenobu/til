import gleam/io

pub fn assignment() {
  io.println("Assignment example")

  // 変数はimmutable（再宣言は可能）
  let x = "Original"
  io.debug(x)

  let y = x
  io.debug(y)

  let x = "New"
  io.debug(x)
  // yは変わらない
  io.debug(y)

  // 使わない変数はwarningが出るが、_で無視できる
  let _z = x

  // タイプアノテーション、あまり使わない
  let _v: String = "This is String"
  let _b: Bool = True
  let _i: Int = 123
  // コンパイルエラー
  // let _f: Float = 1
}
