package logging

// オブジェクトは一つのインスタンスを持つクラスで遅延評価される
object Logger {
  def info(message: String): Unit = println(s"INFO: $message")
}

class Project(name: String, daysToComplete: Int)

class Test {
  val project1 = new Project("TPS Reports", 1)
  val project2 = new Project("Website redesign", 5)
  info("Created projects") // Prints "INFO: Created projects"
}
