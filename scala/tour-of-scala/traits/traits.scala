import scala.collection.mutable.ArrayBuffer

@main
def main(): Unit = {
  {
    val iterator = IntIterator(10)
    println(iterator.next()) // 0
    println(iterator.next()) // 1
  }

  {
    // Pet traitの配列
    val animals = ArrayBuffer.empty[Pet]

    val dog = Dog("Harry")
    val cat = Cat("Sally")
    // Dog, CatはPet traitを継承しているのでPet型に代入可能
    animals.append(dog)
    animals.append(cat)
    animals.foreach(pet => println(pet.name))
  }
}

// 最小のtrait定義はtraitキーワードと識別子だけのもの
trait HairColor

// traitはジェネリクス型やabstractメソッドとして使用すると便利
trait Iterator[A] {
  def hasNext: Boolean
  def next(): A
}

// extendsキーワードを使ってtraitをextendする
// 次にoverrideキーワードで抽象メンバーを実装する
class IntIterator(to: Int) extends Iterator[Int] {
  private var current = 0

  override def hasNext: Boolean = current < to
  override def next(): Int = {
    if hasNext then
      val t = current
      current += 1
      t
    else
      0
  }
}

trait Pet:
  val name: String

class Cat(val name: String) extends Pet
class Dog(val name: String) extends Pet