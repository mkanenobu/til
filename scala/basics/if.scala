// if 式
object main {
  // if (condition) expr [else expr] のかたち
  def whichIsBigger(a: Int, b: Int): Unit = println(if (a > b) "a is bigger than b" else "b is bigger than a")

  def max(a: Int, b: Int, c: Int): Int =
    if (a > b && a > c) {
      a
    } else if (b > a && b > c) { // else if
      b
    } else {
      c
    }

  def main(args: Array[String]): Unit = {
    whichIsBigger(1, 3)
    println(max(1, 2, 3))
  }
}
