// Option型
import scala.util.Random

object main {
  // ランダム生成した float が0.5以上なら10倍してtoIntした値、0.5より小さい場合 None を返す関数
  def getInt(): Option[Int] = {
    val v = Random.nextFloat()
    if (v >= 0.5) Some((v * 10).toInt) else None
  }
  def main(args: Array[String]): Unit = {
    val v = getInt()
    println(s"isEmpty: ${v.isEmpty}")
    // isDefined == !isEmpty
    println(s"isDefined: ${v.isDefined}")
    // nonEmpty は isDefined のエイリアス
    println(s"isDefined: ${v.nonEmpty}")

    // force unwrap
    println(Some("hoge").get)
    // println(None.get) // NoSuchElementException

    // Nullish Coalescing(開発の方針として演算子では定義されていない)
    // 戻り値の型は Option[T] とデフォルト値の共通の親クラスになる(ので同じ型にする必要はない)
    println(v.getOrElse(-1))

    // Some の場合自分自身を、Noneの場合デフォルト値を返す
    // 戻り値の型は自分自身と同じ
    println(v.orElse(Some(-10)))

    // コレクションっぽいメソッドが存在するがコレクションとは全く挙動が違う

    // Some の場合、Option の中身に引数の関数を適用、Noneの場合何もしない
    // コールバックの戻り値は Some でラップされる
    println(v.map(_ * -1))

    // Some の場合、Option の中身に引数の関数を適用、Noneの場合何もしない
    // map と違い中で Some にラップされない(Noneが返せる)
    println(v.flatMap((unwrapped) => if (unwrapped >= 8) Some(unwrapped * 2) else None))

    // flatMapにデフォルト値がついて、戻り値が Option ではなくなった感じ
    // None の場合 -1 を Some の場合、値を10倍にしたものを返す
    println(v.fold(-1)(_ * 10))
  }
}
