/**
  * コンパニオンオブジェクト
  *
  * クラスと同じ名前のオブジェクトはコンパニオンオブジェクトと呼ばれる
  * 逆に同名のクラスはコンパニオンクラスと呼ばれる
  *
  * コンパニオンクラスやコンパニオンオブジェクトは自身のコンパニオンのプライベートメンバーにアクセスできる
  *
  * コンパニオンは同じファイル内で定義される必要がある
  */
import scala.math._

case class Circle(radius: Double) {
  import Circle._
  // calculateArea が見える
  def area: Double = calculateArea(radius)
}

// シングルトンオブジェクト Circle は全ての Circle クラスのインスタンスで使用できる calicurateArea メソッドを持つ
object Circle {
  // radius が見える
  private def calculateArea(radius: Double): Double = Pi * pow(radius, 2.0)
}

// シングルトンオブジェクトはファクトリーメソッドを含むこともできる
class Email(val username: String, val domainName: String)

object Email {
  // Option型
  def fromString(emailString: String): Option[Email] = {
    emailString.split('@') match {
      case Array(a, b) => Some(new Email(a, b))
      case _           => None
    }
  }
}

object main {
  def main(args: Array[String]): Unit = {
    val circle1 = Circle(5.0)
    println(circle1.area)

    // static メソッドのような使い方
    val scalaCenterEmail = Email.fromString("scala.center@epfl.ch")
    scalaCenterEmail match {
      case Some(email) => print(s"""Registered an email
       |Username: ${email.username}
       |Domain name: ${email.domainName}
       |""".stripMargin)
      case None        => println("Error: could not parse email")
    }
  }
}
