case class Book(isbn: String)

case class Message(sender: String, recipient: String, body: String)

object main {
  def main(args: Array[String]): Unit = {
    // ケースクラスは標準でオブジェクトの生成を行う apply メソッドを持っているので
    // 初期化には new キーワードが不要
    val frankenstein = Book("978-0486282114")

    // パラメータ有りでケースクラスを作ると、パラメータはパブリックのvalとなる
    val message1 = Message("guillaume@quebec.ca", "jorge@catalonia.es", "Ça va ?")
    println(message1.sender) // guillaume@quebec.ca が出力されます
    // message1.sender = "travis@washington.us" // valなのでコンパイルエラー

    // ケースクラスは参照ではなく構造で比較される
    val message2 = Message("guillaume@quebec.ca", "jorge@catalonia.es", "Ça va ?")
    println(message1 == message2)

    // copy メソッドを使用してケースクラスのインスタンスのシャローコピーを作成できる
    val message3 = message1.copy(sender = message1.recipient, recipient = "claire@bourgogne.fr")
    println(message3.sender) // jorge@catalonia.es
    println(message3.recipient) // claire@bourgogne.fr
    println(message3.body) // "Ça va ?"
  }
}
