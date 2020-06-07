case class WeeklyWeatherForecast(temperatures: Seq[Double]) {
  private def convertCtoF(temp: Double) = temp * 1.8 + 32
  // 高階関数にはメソッドを渡すこともできる(Scalaコンパイラによって関数に強制変換される)
  def forecastInFahrenheit: Seq[Double] = temperatures.map(convertCtoF)
}

object main {
  // 戻り値の型 (String, String) => String は２つのStringを引数に取り、Stringを返す関数
  def urlBuilder(ssl: Boolean, domainName: String): (String, String) => String = {
    val schema = if (ssl) "https://" else "http://"
    (endpoint: String, query: String) => s"$schema$domainName/$endpoint?$query"
  }

  def main(args: Array[String]): Unit = {
    println(WeeklyWeatherForecast(Seq(13.3, 15.0, 20.1)).forecastInFahrenheit)

    val domainName = "www.example.com"
    def getURL = urlBuilder(ssl = true, domainName)
    val endpoint = "users"
    val query = "id=1"
    val url = getURL(endpoint, query)
    println(url) // "https://www.example.com/users?id=1": String
  }
}
