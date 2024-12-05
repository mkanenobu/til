@main
def main(): Unit = {
  {
    // メソッドには複数のパラメータリストが存在する可能性がある
    // これはScalaのコレクションAPIのtraitで定義されている例
    // 初期値のzと適用する関数であるopの二つのパラメータリストを持つfoldLeftメソッド
    // trait Iterable[A] {
    //   def foldLeft[B](z: B)(op: (B, A) => B): B
    // }

    val numbers = List(1, 2, 3, 4, 5)
    val res = numbers.foldLeft(0)((m, n) => m + n)
    println(res)
  }
}
