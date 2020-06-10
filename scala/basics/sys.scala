import scala.sys._

object main {
  def main(args: Array[String]): Unit = {
    val environmentVariables = env
    environmentVariables.foreach(println)
  }
}
