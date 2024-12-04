@main
def countFiles(): Unit =
  val paths = os.list(os.pwd)
  println(paths.length)