@main
def main(): Unit = {
  println("Factorial of 2: " + factorial(2))
  println("Factorial of 3: " + factorial(3))
}

// Scalaではメソッド定義をネストすることが出来る
def factorial(x: Int): Int = {
  // NOTE: 関数で良いんじゃないかと思ったが関数は再帰呼び出し出来ないよう
  def fact(x: Int, acc: Int): Int = {
    if x <= 1 then acc
    else fact(x - 1, x * acc)
  }
  fact(x, 1)
}
