// クラスが別のクラスをメンバーとして持てる
class Graph {
  class Node {
    var connectedNodes: List[Node] = Nil
    def connectTo(node: Node): Unit = {
      if (!connectedNodes.exists(node.equals)) {
        connectedNodes = node :: connectedNodes
      }
    }
  }
  var nodes: List[Node] = Nil
  def newNode: Node = {
    val res = new Node
    nodes = res :: nodes
    res
  }
}

class Graph2 {
  class Node {
    // 親インスタンスにバインドされたくない場合はこのように書く
    var connectedNodes: List[Graph2#Node] = Nil
    def connectTo(node: Graph2#Node): Unit = {
      if (!connectedNodes.exists(node.equals)) {
        connectedNodes = node :: connectedNodes
      }
    }
  }
  var nodes: List[Node] = Nil
  def newNode: Node = {
    val res = new Node
    nodes = res :: nodes
    res
  }
}

object main {
  def main(args: Array[String]): Unit = {
    val graph1: Graph = new Graph
    val node1: graph1.Node = graph1.newNode
    val node2: graph1.Node = graph1.newNode
    val node3: graph1.Node = graph1.newNode
    node1.connectTo(node2)
    node3.connectTo(node1)

    val graph2: Graph = new Graph
    val node4: graph2.Node = graph2.newNode
    // Scalaでは graph1.Node と graph2.Node は別の型なのでコンパイルエラーになる
    // node1.connectTo(node3) // illegal!

    val graph3 = new Graph2
    val node5 = graph3.newNode
    val graph4 = new Graph2
    val node6 = graph4.newNode
    // ↑はコンパイルエラーになるが, これは通る(graph3.Node と graph4.Node は同じ型)
    node5.connectTo(node6)
  }
}
