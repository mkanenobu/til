// クラス
class Greeter(prefix: String, suffix: String) {
  // Unitはvoidと同じような無いことを示す型(OCamlと同じように値として表現される場合は`()`)
  def greet(name: String): Unit =
    println(prefix + name + suffix)
}

// インスタンス生成
val greeter = new Greeter("Hello, ", "!")
greeter.greet("Scala developer") // Hello, Scala developer!