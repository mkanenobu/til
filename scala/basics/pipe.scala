import scala.util.chaining._

object main {
  def main(args: Array[String]): Unit = {
    val s = "Hello, World!"
    s.toUpperCase().pipe(println)
  }
}
