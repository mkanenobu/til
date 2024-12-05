@main
def main(): Unit = {
  log("System starting")
  log("User not found", "WARNING")
}

// 呼び出し側でパラメータを省略できるようにするためのパラメータのデフォルト値がある
// ScalaのデフォルトパラメータはJavaから呼び出す時にはオプションではなく必須になる
def log(message: String, level: String = "INFO") = println(s"$level: $message")

// Scalaではデフォルトパラメータを持つ2つの同名のメソッドを持てない
// `A.func()` を呼び出したときにどちらを意図しているかコンパイラには判断出来ないため
// ↓のコードはコンパイル不可
// object A {
//   def func(x: Int = 34): Unit
//   def func(y: String = "abc"): Unit
// }