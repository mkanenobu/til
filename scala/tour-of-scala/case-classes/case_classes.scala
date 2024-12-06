@main
def main(): Unit = {
  // 一般的にはnewキーワードは省略されるが付けることも出来る
  // これはcase classがオブジェクトを構築するのに必要なapplyメソッドをデフォルトで持っているため
  val frankenstein = Book("978-0486282114")

  val message1 = Message("guillaume@quebec.ca", "jorge@catalonia.es", "Ça va ?")
  val message2 = Message("jorge@catalonia.es", "guillaume@quebec.ca", "Com va?")
  val message3 = Message("jorge@catalonia.es", "guillaume@quebec.ca", "Com va?")
  // case classは三章ではなく値で比較される
  println("message2 is equals to message3: " + (message2 == message3)) // true

  // copyメソッドでcase classインスタンスのシャローコピーを作成出来る
  // オプションでコンストラクタのパラメータを変更することも出来る
  val message4 = message3.copy()
  val message5 = message4.copy(sender = message4.recipient, recipient = "claire@bourgogne.fr")
  println(message4)
  println(message5)
}

// case classの定義
// 最低限のcase classは `case class` キーワード、識別子、パラメータリスト（空の場合もある）からなる
case class Book(isbn: String)

// パラメータを持つcase classを作成する場合、パラメータはpublicでvalになる
// valなのでimmutableであり変更出来ない
// case classでvarを使うことは可能だが推奨されない
case class Message(sender: String, recipient: String, body: String)