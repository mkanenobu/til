fun sum(a: Int, b: Int): Int {
  return a + b
}

fun sum2(a: Int, b: Int) = a + b

fun printSum(a: Int, b: Int): Unit {
  println("sum of $a and $b is ${a + b}")
}

fun valiables() {
  // 一度しか代入できない
  val a: Int = 1
  val b = 2
  val c: Int
  c = 3

  // 変数
  var x = 5
  x = x + 1
}

// nullable
fun parseInt(str: String): Int? {
  // 
}

fun main(args: Array<String>) {
  printSum(13, 2)
}
