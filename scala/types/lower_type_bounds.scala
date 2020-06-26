// 下限型境界

// 上限型境界の逆で, ある型が別の型のスーパータイプであることを宣言する
trait Node[+B] {
  // この例ではBのスーパータイプであるU型が宣言されている
  def prepend[U >: B](elem: U): Node[U]
}

case class ListNode[+B](h: B, t: Node[B]) extends Node[B] {
  def prepend[U >: B](elem: U): ListNode[U] = ListNode(elem, this)
  def head: B = h
  def tail: Node[B] = t
}

case class Nil[+B]() extends Node[B] {
  def prepend[U >: B](elem: U): ListNode[U] = ListNode(elem, this)
}

object main {
  def main(args: Array[String]): Unit = {
    trait Bird
    case class AfricanSwallow() extends Bird
    case class EuropeanSwallow() extends Bird

    val africanSwallowList = ListNode[AfricanSwallow](AfricanSwallow(), Nil())
    val birdList: Node[Bird] = africanSwallowList
    birdList.prepend(EuropeanSwallow())
  }
}
