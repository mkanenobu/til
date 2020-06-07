abstract class Device
case class Phone(model: String) extends Device {
  def screenOff = "Turning screen off"
}
case class Computer(model: String) extends Device {
  def screenSaverOn = "Turning screen saver on..."
}
case class VirtualMachine() extends Device {
  def screenSaverOn = "Turning host machine to sleep..."
}

// トレイトとクラスにsealedを付けると全てのサブタイプは同一ファイル内で宣言される必要がある
// つまり全てのサブタイプが既知であることを保証できるので、その他全てに対応するケースを作る必要がなくなる
sealed abstract class Furniture
case class Couch() extends Furniture
case class Chair() extends Furniture

object main {
  def goIdle(device: Device) = device match {
    // 型のみでマッチング
    case p: Phone    => p.screenOff
    case c: Computer => c.screenSaverOn
  }

  def findPlaceToSit(piece: Furniture): String = piece match {
    case a: Couch => "Lie on the couch"
    case b: Chair => "Sit on the chair"
  }

  def main(args: Array[String]): Unit = {
    println(goIdle(Phone("iPhone 8")))
    println(goIdle(Computer("MacBook")))
    // println(goIdle(VirtualMachine())) // マッチエラーでコンパイル不可

    println(findPlaceToSit(Couch()))
    println(findPlaceToSit(Chair()))
  }
}
