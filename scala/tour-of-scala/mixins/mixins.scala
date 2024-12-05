@main
def main(): Unit = {
  {
    val d = D()
    println(d.message)
    println(d.loudMessage)
  }

  {
    val iter = StringIterator("Scala")
    println(iter.next())
    println(iter.next())
  }

  {
    val richStringIter = RichStringIter()
    richStringIter.foreach(println)
  }
}

// mixinはクラスを構成するためのtrait
abstract class A {
  val message: String
}

class B extends A {
  val message = "I'm an instance of class B"
}

trait C extends A {
  def loudMessage = message.toUpperCase()
}
// クラスDにはスーパークラスBとミックスインCがある
// スーパクラスは一つしか持てないが、ミックスインは複数持てる
class D extends B, C

// abstract class
abstract class AbsIterator {
  type T
  def hasNext: Boolean
  def next(): T
}
// abstract classを継承したクラス
class StringIterator(s: String) extends AbsIterator {
  type T = Char
  private var i = 0
  def hasNext = i < s.length
  def next() =
    val ch = s.charAt(i)
    i += 1
    ch
}
// abstract classを継承したtrait
// RichIteratorはAbsIteratorを拡張してforeachメソッドを実装している
// RichIteratorはtraitなのでAbsIteratorの抽象メンバーの実装を持たないが、抽象メンバーを（hasNext, next）利用した実装を持っている
trait RichIterator extends AbsIterator:
  def foreach(f: T => Unit): Unit = while hasNext do f(next())

// 新しいRichStringIterはStringIteratorをスーパークラスに持ち、RichIteratorをミックスインしている
class RichStringIter extends StringIterator("Scala"), RichIterator
