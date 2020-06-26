// トレイトや抽象クラスのような抽象型は抽象型メンバーを持てる
trait Buffer {
  type T
  val element: T
}

abstract class SeqBuffer extends Buffer {
  type U // 新しい抽象型U
  // element の型は Seq[U] のサブタイプになる
  type T <: Seq[U]
  // Seq[U] のサブタイプと宣言された影響でlengthメソッドを持つ
  def length = element.length
}

abstract class IntSeqBuffer extends SeqBuffer {
  // U の型をIntと宣言する, つまり element の型は Seq[Int] のサブタイプになる
  type U = Int
}

object main {
  def main(args: Array[String]): Unit = {
    def newIntSeqBuf(elem1: Int, elem2: Int): IntSeqBuffer =
      new IntSeqBuffer {
        type T = List[U]
        val element = List(elem1, elem2)
      }

    val buf = newIntSeqBuf(7, 8)
    println("length = " + buf.length)
    println("content = " + buf.element)
  }
}

// 抽象型メンバーをクラスの型パラメータに変えることもできる(できないケースもある)
trait Buffer2[+T] {
  val element: T
}
abstract class SeqBuffer2[U, +T <: Seq[U]] extends Buffer2[T] {
  def length = element.length
}

object main2 {
  def main(args: Array[String]): Unit = {
    def newIntSeqBuf(e1: Int, e2: Int): SeqBuffer2[Int, Seq[Int]] =
      new SeqBuffer2[Int, List[Int]] {
        val element = List(e1, e2)
      }

    val buf = newIntSeqBuf(7, 8)
    println("length = " + buf.length)
    println("content = " + buf.element)
  }
}
