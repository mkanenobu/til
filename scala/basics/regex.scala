import scala.util.matching.Regex

object main {
  val numberPattern: Regex = "[0-9]".r
  def includesNumber(s: String): Unit = numberPattern.findFirstMatchIn(s) match {
    case Some(_) => println("Password OK")
    case None    => println("Password must contain a number")
  }

  def main(args: Array[String]): Unit = {
    // 正規表現インスタンス

    val invalidPassword = "mypassword"
    includesNumber(invalidPassword)
    val validPassword = "password1234"
    includesNumber(validPassword)

    val input: String =
      """background-color: #A03300;
      |background-image: url(img/header100.png);
      |background-position: top center;
      |background-repeat: repeat-x;
      |background-size: 2160px 108px;
      |margin: 0;
      |height: 108px;
      |width: 100%;""".stripMargin

    val keyValPattern: Regex = "([0-9a-zA-Z-#() ]+): ([0-9a-zA-Z-#() ]+)".r
    // capture
    for (patternMatch <- keyValPattern.findAllMatchIn(input))
      println(s"key: ${patternMatch.group(1)}, value: ${patternMatch.group(2)}")
  }
}
