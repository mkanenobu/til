// for内包表記
// for (enumerators) yield e という形を取る

object main {
  def max(list: List[Int]): Int = {
    var result = 0
    for (n <- list) if (n > result) result = n
    result
  }

  def main(args: Array[String]): Unit = {
    val tuples = List(("First", 1), ("Second", 2), ("Third", 3), ("Fourth", 4), ("Fifth", 5))
    val numbers: List[Int] = for (n <- tuples) yield n._2
    numbers.foreach(n => println(n))
    // ガードのようなもの、条件を満たさない要素はyieldに渡されない
    val ordinals: List[String] = for (n <- tuples if n._2 >= 3) yield n._1
    ordinals.foreach(n => println(n))

    println(max(numbers))
  }
}
