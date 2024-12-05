// 型について

// Anyが全ての型のスーパータイプで、equals, hashCode, toStringなどのユニバーサルなメソッドが定義されている
// AnyはAnyValとAnyRefという2つの直接的なサブクラスを持つ

// AnyValは値型を表し、定義済みの型が9つある
// Double, Float, Long, Int, Short, Byte, Char, Unit, Boolean
// Unitは意味のある情報を持たず、`()` という唯一のインスタンスを持つ

// AnyRefは参照型を表し、全ての値型以外の型は参照型として定義される
// Scalaのユーザー定義型は全てAnyRefのサブタイプ
// ScalaがJavaランタイム環境で動作する場合、AnyRefは `java.lang.Object` に対応する

// 値型のキャストは一方向
// Byte -> Short -> Int -> Long -> Float -> Double
//          Char -> Int

// NothingとNull
// Nothingは全ての型のサブタイプ（Bottom Type）でNothing型の値は存在しない
// Nothingの一般的な用途は、例外をスローするメソッドの戻り値など
// Nullは全ての参照型のサブタイプで、nullという唯一の値を持つ
// Nullは主にJVM言語との相互運用のために存在し、Scalaのコードではほとんど利用されない

@main
def main(): Unit = {
  val list: List[Any] = List(
    "a string",
    732,  // an integer
    'c',  // a character
    true, // a boolean value
    () => "an anonymous function returning a string"
  )

  list.foreach(element => println(element))

  cast()
}

def cast(): Unit = {
  val x: Long = 987654321
  val y: Float = x.toFloat
  // 暗黙のキャストも可能
  val z: Float = x

  val face: Char = '☺'
  val number: Int = face
  val f: Char = number.toChar
  // 明示的なキャストは出来るが暗黙のキャストは一方向なので次のコードはエラーになる
  // val f: Char = number
}