// Enumration を継承する形
object Color extends Enumeration {
  val Blue, Red, Green, White = Value // ValueはEnumerationのメソッド
}

// case class を使う形
sealed trait Color2
case class Blue2() extends Color2
case class Red2() extends Color2
case class Green2() extends Color2
case class White2() extends Color2

// idメソッドとapplyメソッドで数値と相互変換できる
object Main {
  import Color._

  def main(args: Array[String]): Unit = {
    // id
    println(Blue.id)
    println(Red.id)
    println(Green.id)
    println(White.id)
    // apply
    println(Color(0))
    println(Color(1))
    println(Color(2))
    println(Color(3))
    // maxId
    println(Color.maxId)
    // values
    println(Color.values)
    // withName
    println(Color.withName("Red"))
  }
}
