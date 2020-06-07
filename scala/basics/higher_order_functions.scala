// 高階関数

object main {
  def main(args: Array[String]): Unit = {
    val salaries = Seq(20000, 70000, 40000)
    val doubleSalary = (x: Int) => x * 2
    // 定義済みの関数を使用
    println(salaries.map(doubleSalary))
    // 無名関数を使用
    println(salaries.map(x => x * 2))
    // 慣用的な書き方、パラメータ名は`_`を使用する必要がある
    println(salaries.map(_ * 2))
  }
}
