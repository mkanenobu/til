// トレイト
// トレイトはフィールドとメソッドを含む型、継承やオーバーライドすることも可能

// ベーストレイト
trait Greeter {
  def greet(name: String): Unit =
    println("Hello, " + name + "!")
}

// ベーストレイトをそのまま継承したクラス
class DefaultGreeter extends Greeter

// ベーストレイトを継承し、メソッドをオーバーライドしたクラス
// 複数のトレイトを継承することも可能
class CustomizableGreeter(prefix: String, postfix: String) extends Greeter {
  override def greet(name: String): Unit = {
    println(prefix + name + postfix)
  }
}

val greeter = new DefaultGreeter()
greeter.greet("Scala developer") // Hello, Scala developer!

val customGreeter = new CustomizableGreeter("How are you, ", "?")
customGreeter.greet("Scala developer") // How are you, Scala developer?