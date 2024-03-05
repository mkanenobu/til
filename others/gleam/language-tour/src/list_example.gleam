import gleam/io

pub fn list_example() {
  io.println("List example")

  let ints: List(Int) = [1, 2, 3]
  io.debug(ints)

  // 追加、immutableなのでintsに追加することは出来ない
  io.debug([-1, 0, ..ints])
  // リストの要素を数えたり、リストの要素をインデックスで取り出すのはコストが高いのであまりやらないし、データ型としてそういった用途には不向き
}
