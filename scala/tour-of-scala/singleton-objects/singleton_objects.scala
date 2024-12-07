import scala.math.{Pi, pow}

@main
def main(): Unit = {
  {
    // オブジェクトはインスタンスを一つだけ持つクラスで、lazy valのように参照時に遅延して作成される
    // オブジェクトの定義はクラス定義と似ているが`object`キーワードを使う
    object Box

    // メソッドを持つオブジェクトの例
    // このinfoメソッドはプログラムのどこからでも直接インポート出来る
    // import [package].Logger.info
    object Logger {
      def info(message: String): Unit = println(s"INFO: $message")
    }

    Logger.info("System starting")
  }

  {
    // コンパニオンオブジェクト
    // クラスと同じ名前を持つオブジェクトはコンパニオンオブジェクトと呼ばれる
    // その場合、クラスはオブジェクトのコンパニオンクラスと呼ばれる
    // コンパニオンクラス・オブジェクトはそのコンパニオンのプライベートメンバーにアクセスできる
    case class Circle(radius: Double) {
      import Circle.*
      // コンパニオンオブジェクトのプライベートメソッドを参照
      def area: Double = calculateArea(radius)
    }
    object Circle {
      private def calculateArea(radius: Double): Double = Pi * pow(radius, 2.0)
    }

    val circle1 = Circle(5.0)
    println(circle1.area)

    // コンパニオンオブジェクトにはファクトリメソッドを含めることが出来る
    // NOTE: Scalaにはstaticメソッド（フィールド）が無いのでこれが実質的な代替手段になる
    // クラス・オブジェクトにコンパニオンがある場合には同じファイルに定義する必要がある
    class Email(val username: String, val domainName: String)
    object Email {
      def fromString(emailString: String): Option[Email] = {
        emailString.split('@') match {
          case Array(a, b) => Some(Email(a, b))
          case _ => None
        }
      }
    }
    val scalaCenterEmail = Email.fromString("scala.center@epfl.ch")
    scalaCenterEmail match {
      case Some(email) => println(
        s"""Registered an email
           |Username: ${email.username}
           |Domain name: ${email.domainName}
         """.stripMargin)
      case None => println("Error: could not parse email")
    }
  }
}
