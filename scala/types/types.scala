/**
  * Any型はすべての型のスーパータイプ
  * Anyは equals、hashCode、toStringのようないくつかの普遍的なメソッドを定義していて
  * AnyValとAnyRefという2つの直系のサブクラスを持つ
  *
  * AnyValは値型で事前に定義された9の値型がある
  * Double、Float、Long、Int、Short、Byte、Char、Unit、Boolean
  * これらはnull非許容
  *
  * AnyRefは参照型ですべてのユーザー定義型はAnyRefのサブタイプ
  *
  *
  * Nothing型はすべての型のサブタイプ
  * Nothing型を持つ値は存在せず、一般的に例外のスロー、プログラム終了、無限ループなど終了していないことを示すのに使用される
  *
  * Nullは全ての参照型のサブタイプ(つまり全てのAnyRefのサブタイプ)
  * nullというキーワードリテラルが指す値を1つだけ持つ
  *
  * Null は、ほぼ他のJVM言語との相互運用性のためだけに提供されているので、Scalaのコード内ではほとんどの場合、使われるべきではない
  */
object main {
  def main(args: Array[String]): Unit = {
    val list: List[Any] = List(
      "a string",
      732, // integer
      'c', // character
      true, // boolean value
      () => "文字列を返す無名関数"
    )
    list.foreach(element => println(element))
  }
}
