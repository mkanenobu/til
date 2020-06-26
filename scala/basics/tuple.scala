/**
  * タプル
  */
object main {
  def main(args: Array[String]): Unit = {
    // パラメータ数によってTuple2からTuple22まで存在する
    val ingredient: (String, Int) = ("Sugar", 25) // (String, Int) == Tuple2[String, Int]
    val integers: Tuple3[Int, Int, Int] = (1, 2, 3)
    // Syntax Sugar
    val integer2: Tuple2[Int, Int] = 1 -> 2 // same as (1, 2)
    val integer3: Tuple2[Tuple2[Int, Int], Int] = 1 -> 2 -> 3 // same as ((1, 2), 3)
    val integer4: Tuple2[Int, Tuple2[Int, Int]] = 1 -> (2 -> 3) // same as (1, (2, 3))
    // 要素へのアクセス
    println(ingredient._1)
    println(ingredient._2)

    // タプルのパターンマッチング
    val planets =
      List(("Mercury", 57.9), ("Venus", 108.2), ("Earth", 149.6), ("Mars", 227.9), ("Jupiter", 778.3))

    planets.foreach {
      case ("Earth", distance) =>
        println(s"Our planet is $distance million kilometers from the sun")
      case _ =>
    }

    val numPairs = List((2, 5), (3, -7), (20, 56))
    for ((a, b) <- numPairs) {
      println(a * b)
    }
  }
}
