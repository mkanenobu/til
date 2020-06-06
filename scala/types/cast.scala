/**
  * 型キャスト
  *
  * 値型のキャストは下記の順序で可能（非可逆）
  * Byte -> Short -> Int -> Long -> Float -> Double
  *             Char ⤴
  */
object main {
  def main(args: Array[String]): Unit = {
    val x: Long = 987654321
    val y: Float = x // 9.8765434E8 (精度は低下)
    // val z: Long = y // コンパイルエラー

    val face: Char = '☺'
    val number: Int = face // 9786
  }
}
