import scala.collection.mutable.ArrayBuffer

trait Pet {
  val name: String
}

class Cat(val name: String) extends Pet
class Dog(val name: String) extends Pet

object main {
  def main(args: Array[String]): Unit = {
    val dog = new Dog("Harry")
    val cat = new Cat("Sally")

    val animals = ArrayBuffer.empty[Pet]
    animals.append(dog)
    animals.append(cat)
    animals.foreach(pet => println(pet.name)) // Prints Harry Sally
  }
}
