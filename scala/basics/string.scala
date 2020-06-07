object main {
  def main(args: Array[String]): Unit = {
    val name = "John!"
    val s1 = "Hello, World!"
    val s2 = s"Hello, $name"
    val s3 = """Hello,
    |World
    """.stripMargin
    println(s1)
    println(s2)
    println(s3)
  }
}
