import gleam/io

pub fn blocks() {
  io.println("Blocks example")

  // ブロックは一つ以上の式の集まりで、最後の評価値がブロック全体の評価値となる（Rustと同じ）
  let x = {
    let y = 10
    y + 5
  }

  // 式の評価順序をコントロール出来る
  let _z = x + 5 * 10
  let _z = { x + 5 } * 10
  // こうは書けない
  // let _z = (x + 5) * 10
}
