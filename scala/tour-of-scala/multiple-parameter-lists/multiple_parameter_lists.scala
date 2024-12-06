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

  {
    // multiple parameter listsのユースケース
    def foldLeft1[A, B](as: List[A], b0: B, op: (B, A) => B): B =
      as.foldLeft(b0)(op)
    val numbers = List(1, 2, 3, 4, 5)
    // foldLeft1メソッドをこのように呼び出したいがコンパイルが通らない（NOTE: scala runだと何故か通る）
    // val res = foldLeft1(numbers, 0, _ + _)

    // これは関数opの型を推論出来ないため
    // Scalaはパラメータの型推論をパラメータリスト単位で行うため
    // opの型に利用されているA, Bはasとb0によって解決されるのでas, b0とopが同じパラメータリストにあると型が解決出来ない
    // これを解決するためには下記のいずれかの方法で呼び出す必要がある
    // 1. ジェネリクスの型を明示的に指定する
    val first = foldLeft1[Int, Int](numbers, 0, _ + _)
    // 2. 関数opの型を明示する
    val second = foldLeft1(numbers, 0, (a: Int, b: Int) => a + b)

    // オリジナルのfoldLeftのようにパラメータリストごと分ければそもそもそういった問題が発生しない
    def foldLeft2[A, B](as: List[A], b0: B)(op: (B, A) => B) =
      as.foldLeft(b0)(op)
    val third = foldLeft2(numbers, 0)(_ + _)
  }

  {
    // 部分適用
    // メソッドが少ないパラメータリストで呼び出されると不足しているパラメータリストを引数として取る関数が生成される
    // これは部分適用と呼ばれる
    val numbers = List(1, 2, 3, 4, 5)
    val numberFunc = numbers.foldLeft(List[Int]())

    val squares = numberFunc((xs, x) => xs :+ x*x)
    println(squares)
    val cubes = numberFunc((xs, x) => xs :+ x*x*x)
    println(cubes)
  }

  {
    // multiple parameter listsはカリー化に似ているが、multiple parameter listsに対してカリー化という単語を適用するのはいくつかの理由でやめた方がよい
    // 1. multiple parameter listsは一般的なカリー化のように関数が連続している訳ではなく、そういうシンタックスであるため
    // 2. multiple parameter listsを全く含まない、Scalaの標準ライブラリ「curried」「uncurried」と混同される危険性があるため

    // ただmultiple parameter listsとカリー化には類似点があり、呼び出し側から見ると同じように見えることもある
    def addMultiple(n1: Int)(n2: Int) = n1 + n2
    def add(n1: Int, n2: Int) = n1 + n2
    val addCurried1 = (add _).curried
    val addCurried2 = (n1: Int) => (n2: Int) => n1 + n2

    println(addMultiple(1)(2))
    println(addCurried1(1)(2))
    println(addCurried2(1)(2))
  }
}
