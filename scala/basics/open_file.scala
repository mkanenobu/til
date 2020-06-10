import scala.io.Source

object main {
  def main(args: Array[String]): Unit = {
    val home = sys.env("HOME")
    val filename = s"$home/.bash_profile"

    val f = Source.fromFile(filename)
    for (line <- f.getLines) {
      println(line)
    }

    // concat
    println(f.mkString)
  }
}
