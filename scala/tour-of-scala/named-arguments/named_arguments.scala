@main
def main(): Unit = {
  // メソッドを呼び出すときにパラメータ名を明示出来る
  {
    printName("John", "Public")
    printName(first = "John", last = "Public")
    printName(last = "Public", first = "John")
    printName("Elton", last = "John")
  }

  {
    printFullName(first = "John", last = "Public")
    printFullName("John", last = "Public")
    // 順番通りなら名前付き引数の後に名前付き引数を使わなくても良い（混在出来る）
    printFullName("John", middle = "Quincy", "Public")
    printFullName(last = "Public", first = "John")
    // 最初に本来なら3つ目のlastが指定されているのでその後にPositional引数の指定は出来ず、コンパイル出来ない
    // printFullName(last = "Public", "John")
  }

  // 名前付き引数はJavaのメソッド呼び出しでも機能するが、ライブラリが `-parameters` フラグ付きでコンパイルされている場合に限られる
}

def printName(first: String, last: String): Unit =
  println(s"$first $last")

def printFullName(first: String, middle: String = "Q.", last: String): Unit =
  println(s"$first $middle $last")