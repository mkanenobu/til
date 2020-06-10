object main {
  def now() = System.currentTimeMillis

  def tarai(x: Int, y: Int, z: Int): Int =
    if (x <= y) y
    else {
      tarai(tarai(x - 1, y, z), tarai(y - 1, z, x), tarai(z - 1, x, y))
    }

  def taraiLazy(x: => Int, y: => Int, z: => Int): Int =
    if (x <= y) y
    else {
      taraiLazy(taraiLazy(x - 1, y, z), taraiLazy(y - 1, z, x), taraiLazy(z - 1, x, y))
    }

  def main(args: Array[String]): Unit = {
    var start = now()
    val res1 = tarai(16, 8, 0)
    println(s"result: $res1, time: ${now() - start}")

    start = now()
    val res2 = taraiLazy(16, 8, 0)
    println(s"result: $res2, time: ${now() - start}")
  }
}
