// 最小のトレイト
trait HairColor

// トレイトはジェネリクスと組み合わせられる
trait Iterator[A] {
  def hasNext: Boolean
  def next(): A
}

class IntIterator(to: Int) extends Iterator[Int] {
  private var current = 0
  override def hasNext: Boolean = current < to
  override def next(): Int = {
    if (hasNext) {
      val t = current
      current += 1
      t
    } else 0
  }
}

object main {
  def main(args: Array[String]): Unit = {
    val iterator = new IntIterator(3)
    println(iterator.next()) // returns 0
    println(iterator.next()) // returns 1
    println(iterator.hasNext) // true
    println(iterator.next()) // returns 2
    println(iterator.hasNext) // false
  }
}
