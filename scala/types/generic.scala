class Stack[A] { // 型パラメータに A を使う習慣がある
  private var elements: List[A] = Nil // Nil は空のコレクションを表現する(nullとは違う)
  // `::` == cons
  def push(x: A) = elements = x :: elements
  def peek: A = elements.head
  def pop(): A = {
    val currentTop = peek
    elements = elements.tail
    currentTop
  }
}

object main {
  def main(args: Array[String]): Unit = {
    // この場合 Int かそのサブタイプしか入らない
    val stack = new Stack[Int]
    stack.push(20)
    stack.push('s') // 暗黙のキャスト
    println(stack.pop)
    println(stack.pop)
  }
}
