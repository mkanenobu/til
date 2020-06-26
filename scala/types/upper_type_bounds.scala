// 上限型境界

abstract class Animal {
  def name: String
}

abstract class Pet extends Animal {}

class Cat extends Pet {
  override def name: String = "Cat"
}

class Dog extends Pet {
  override def name: String = "Dog"
}

class Lion extends Animal {
  override def name: String = "Lion"
}

// PはPetのサブタイプしか取れない
class PetContainer[P <: Pet](p: P) {
  def pet: P = p
}

object main {
  def main(args: Array[String]): Unit = {
    // PetのサブタイプのDog, Catは型パラメータに取れる
    val dogContainer = new PetContainer[Dog](new Dog)
    val catContainer = new PetContainer[Cat](new Cat)
    // Animalのサブタイプ(Petと同じレイヤー)のLionは取れない
    // val lionContainer = new PetContainer[Lion](new Lion) // コンパイルエラー
  }
}
