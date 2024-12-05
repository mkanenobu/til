@main
def main(): Unit = {
  // 高階関数
  {
    val salaries = Seq(20_000, 70_000, 40_000)
    val doubleSalary = (x: Int) => x * 2
    val newSalaries = salaries.map(doubleSalary) // List(...)
    // 匿名関数
    // 型は推論されるのでxがInt型であることを明示する必要はない
    val newSalaries2 = salaries.map(x => x * 2)
    // 慣用的な省略記法
    val newSalaries3 = salaries.map(_ * 2)
  }

  {
    // 関数を返す関数
    // urlBuilderは `(String, String) => String` 型の関数を返す
    def urlBuilder(ssl: Boolean, domainName: String): (String, String) => String = {
      val schema = if ssl then "https://" else "http://"
      (endpoint: String, query: String) => s"$schema$domainName/$endpoint?$query"
    }

    val domainName = "www.example.com"
    // getURLの中身は `(endpoint: String, query: String) => s"https://www.example.com/$endpoint?$query"` のようになっている
    def getURL = urlBuilder(ssl=true, domainName)
    val endpoint = "users"
    val query = "id=1"
    val url = getURL(endpoint, query)
    println(url)
  }
}

case class WeeklyWeatherForecast(temparatures: Seq[Double]) {
  private def convertCtoF(temp: Double) = temp * 1.8 + 32
  // Scalaのコンパイラはメソッドを関数に変換するのでメソッドを高階関数の引数に渡すことが出来る
  def forecastInFahrenheit: Seq[Double] = temparatures.map(convertCtoF)
}

// 高階関数を使わない例
object SalaryRaiser:
  def smallPromotion(salaries: List[Double]): List[Double] =
    salaries.map(salary => salary * 1.1)
  def greatPromotion(salaries: List[Double]): List[Double] =
    salaries.map(salary => salary * math.log(salary))
  def hugePromotion(salaries: List[Double]): List[Double] =
    salaries.map(salary => salary * salary)

// 高階関数を使って書き換えた例
object SalaryRaiser2:
  private def promotion(salaries: List[Double], promotionFunction: Double => Double): List[Double] =
    salaries.map(promotionFunction)

  def smallPromotion(salaries: List[Double]): List[Double] =
    promotion(salaries, salary => salary * 1.1)
  def greatPromotion(salaries: List[Double]): List[Double] =
    promotion(salaries, salary => salary * math.log(salary))
  def hugePromotion(salaries: List[Double]): List[Double] =
    promotion(salaries, salary => salary * salary)