// オブジェクト
// オブジェクトはそれ自体が定義である単一のインスタンス、自分自身のクラスのシングルトンとも言える
object IdFactory {
  private var counter = 0
  def create(): Int = {
    counter += 1
    counter
  }
}

val newId: Int = IdFactory.create()
println(newId) // 1
val newerId: Int = IdFactory.create()
println(newerId) // 2