class Foo[+A] // 共変(covariant)
class Bar[-A] // 反変(contravariant)
class Baz[A] // 非変(invariant)

abstract class Animal {
  def name: String
}
case class Cat(name: String) extends Animal
case class Dog(name: String) extends Animal

// 反変は共変の逆でAがBのサブタイプであるとき、Hoge[B] は Hoge[A] のサブタイプになる
abstract class Printer[-A] {
  def print(value: A): Unit
}
class AnimalPrinter extends Printer[Animal] {
  def print(animal: Animal): Unit =
    println("The animal's name is: " + animal.name)
}
class CatPrinter extends Printer[Cat] {
  def print(cat: Cat): Unit =
    println("The cat's name is: " + cat.name)
}

object CovarianceTest extends App {
  // List クラスの型パラメータは共変なので List[Cat] や List[Dog] を List[Animal] として扱える
  def printAnimalNames(animals: List[Animal]): Unit = {
    animals.foreach { animal => println(animal.name) }
  }

  val cats: List[Cat] = List(Cat("Whiskers"), Cat("Tom"))
  val dogs: List[Dog] = List(Dog("Fido"), Dog("Rex"))

  printAnimalNames(cats)
  // Whiskers
  // Tom

  printAnimalNames(dogs)
  // Fido
  // Rex

  val myCat: Cat = Cat("Boots")

  def printMyCat(printer: Printer[Cat]): Unit = {
    printer.print(myCat)
  }

  val catPrinter: Printer[Cat] = new CatPrinter
  val animalPrinter: Printer[Animal] = new AnimalPrinter

  printMyCat(catPrinter)
  // Printer[Animal] は Print[Cat] のサブタイプなので Printer[Animal] を Printer[Cat] として使用できる
  printMyCat(animalPrinter)

  // 非変は共変でも反変でもないことを意味する
  // ジェネリッククラスはデフォルトで非変
  class Container[A](value: A) {
    private var _value: A = value
    def getValue: A = _value
    def setValue(value: A): Unit = {
      _value = value
    }
  }

  val catContainer: Container[Cat] = new Container(Cat("Felix"))
  // 仮に共変だとスーパークラスを経由して,別の型の値を使用できてしまう
  // val animalContainer: Container[Animal] = catContainer // 非変なのでこの時点でコンパイルエラーになる
  // animalContainer.setValue(Dog("Spot"))
  // val cat: Cat = catContainer.getValue // おっと、犬を猫に割り当ててしまった。
}
