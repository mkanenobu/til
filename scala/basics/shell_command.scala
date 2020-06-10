import scala.sys.process._
object main {
  def main(args: Array[String]): Unit = {
    val process: ProcessBuilder = Process("date", Seq("+%N")) // nanoseconds

    // 同期的なAPI
    // 出力を標準出力に流し、exit codeを返す
    process.!

    // 標準出力をキャプチャ
    val out = process.!!
    print(out)

    val files = "find . -depth 2".lazyLines_!(ProcessLogger(line => ()))
    files.foreach(println)
  }
}
