trait Animal {
  val ja: String
  def call(): Unit
}

object Dog extends Animal {
  val ja = "犬"
  def call(): Unit = println("ワンワン")
}
object Cat extends Animal {
  val ja = "猫"
  def call(): Unit = println("にゃーにゃー")
}

object Main {
  def main(args: Array[String]): Unit = {
    println(Dog.ja)
    Dog.call()
    println(Cat.ja)
    Cat.call()
  }
}
