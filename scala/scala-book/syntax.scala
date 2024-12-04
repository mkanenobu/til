import scala.collection.mutable.ListBuffer

def double(ints: List[Int]): List[Int] =
  val buffer = new ListBuffer[Int]()
  for i <- ints do
    buffer += i * 2
  buffer.toList

@main
def main(): Unit =
  val oldNumbers = List(1, 2, 3)
  val newNumbers = double(oldNumbers)
  println(newNumbers)