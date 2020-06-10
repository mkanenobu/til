object main {
  def main(args: Array[String]): Unit = {
    List[Any](
      // Int, 32bit
      255,
      0xff, // Hex
      // Long, 64bit
      255L,
      0xFFL,
      255: Long,
      // Double, dかDをつけるとDoubleになる
      1.0,
      1d,
      1e2,
      2e-1,
      // Float
      1.0f,
      1f,
      1e2f,
      2e-1f,
      1: Float,
      // Byte
      123.toByte,
      // Short
      123.toShort,
      // BigInt. 任意精度の整数
      BigInt(123456789) * 123456789 * 123456789,
      // BigDecimal
      BigDecimal(1.23) * 12345678.9 * 12345678.9,
      // (n, m) => n * (10 ** -m)
      BigDecimal(1, 2)
    ).foreach(println)
  }
}
