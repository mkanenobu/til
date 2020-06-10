object main {
  def max(list: List[Int]): Int = {
    var result = 0
    // イテレータを渡す for
    for (n <- list) if (n > result) result = n
    result
  }

  def main(args: Array[String]): Unit = {
    // to, until は Range 型を返す
    // カウントアップ, 1から10まで
    for (i <- 1 to 10) {
      println(i)
    }
    // カウントアップ, 1から9まで
    for (i <- 1 until 10) {
      println(i)
    }
    // ステップ
    for (i <- 0 to 100 by 25) {
      println(i)
    }
    // カウントダウン(ステップ)
    for (i <- 50 to 0 by -10) {
      println(i)
    }
    // ジェネレータの後に条件をつけてフィルターすることができる
    for (i <- 0 to 100 if i % 10 == 0) {
      // (i % 10 == 0) == false の要素はスキップされる
      println(i)
    }
    // 複数の条件を書ける(&&で繋げばいいと思う)
    for (i <- 0 to 100 if i % 10 == 0; if i % 15 == 0) {
      println(i)
    }

    val tuples = List(("First", 1), ("Second", 2), ("Third", 3), ("Fourth", 4), ("Fifth", 5))
    // for内包表記
    // for (generator) yield e という形を取り IndexedSeq[T] を返す
    val numbers: List[Int] = for (n <- tuples) yield n._2
    numbers.foreach(n => println(n))
    // ガードのようなもの、条件を満たさない要素はyieldに渡されない
    val ordinals: List[String] = for (n <- tuples if n._2 >= 3) yield n._1
    ordinals.foreach(n => println(n))

    println(max(numbers))
  }
}
