/**
  * 抽出子オブジェクト
  *
  * 抽出子オブジェクトはunapplyメソッドを持つオブジェクト
  */
import scala.util.Random

object CustomerID {
  // name から CustomerID 文字列を作る
  def apply(name: String) = s"$name--${Random.nextLong}"

  // CustomerID 文字列から name を返す
  // unapply メソッドは Boolean か Option型を返す必要がある
  def unapply(customerID: String): Option[String] = {
    val stringArray: Array[String] = customerID.split("--")
    if (stringArray.tail.nonEmpty) Some(stringArray.head) else None
  }
}

object main {
  def main(args: Array[String]): Unit = {
    // CustomerID.apply("Sukyoung") と同じ
    val customer1ID = CustomerID("Sukyoung")

    println(customer1ID) // Sukyoung--23098234908

    customer1ID match {
      // unapply メソッドを使用
      case CustomerID(name) => println(name) // prints Sukyoung
      case _                => println("Could not extract a CustomerID")
    }

    val customer2ID = CustomerID("Nico")
    // val name = CustomerID.unapply(customer2ID).get と同じ
    val CustomerID(name) = customer2ID
    println(name) // prints Nico

    // None を返す場合 scala.MatchError になる
    // val CustomerID(name2) = "-asdfasdfasdf" // エラー
  }
}
