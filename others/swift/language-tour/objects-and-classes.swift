// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/guidedtour/#Objects-and-Classes

/// クラス

// クラス定義
class Shape {
  // プロパティ
  var numberOfSides = 0

  // メソッド
  func simpleDescription() -> String {
    return "A shape with \(numberOfSides) sides."
  }
}

// インスタンス化
var shape = Shape()
// プロパティへのアクセス
shape.numberOfSides = 7
// メソッドの呼び出し
print(shape.simpleDescription())

// コンストラクタを持つクラス
class NamedShape {
  var numberOfSides: Int = 0
  var name: String

  // コンストラクタ
  init(name: String) {
    // プロパティのnameと引数のnameを区別するためにselfでプロパティを参照
    self.name = name
  }

  func simpleDescription() -> String {
    // selfありでもなしでもどちらでも参照出来る
    return "A shape named \(name) with \(self.numberOfSides) sides."
  }
}

do {
  // デコンストラクタ
  class WithDeinit: NamedShape {
    deinit {
      print("deinit")
    }
  }

  let namedShape = WithDeinit(name: "triangle")
  namedShape.numberOfSides = 3
  print(namedShape.simpleDescription())
  // ブロックを抜けるとインスタンスが解放されるのでdeinitが走る
}

// サブクラスの定義（継承）
// スーパークラスを指定しない場合には暗黙的にルートクラスを継承している
class Square: NamedShape {
  var sideLength: Double

  init(sideLength: Double, name: String) {
    self.sideLength = sideLength
    super.init(name: name)
    numberOfSides = 4
  }

  func area() -> Double {
    return sideLength * sideLength
  }

  // overrideでスーパークラスのメソッドをオーバーライド
  override func simpleDescription() -> String {
    return "A square with sides of length \(sideLength)"
  }
}
let test = Square(sideLength: 5.2, name: "my test square")
print("area:", test.area())
print(test.simpleDescription())

// プロパティのセッター・ゲッター
class EquilateralTriangle: NamedShape {  // 正三角形
  var sideLength: Double = 0.0

  init(sideLength: Double, name: String) {
    self.sideLength = sideLength
    super.init(name: name)
    numberOfSides = 3
  }

  // 周囲長
  var perimeter: Double {
    get {
      return 3.0 * sideLength
    }
    set(n) {
      sideLength = n / 3.0
    }
    // セッターの仮引数は省略可能で、省略すると暗黙的にnewValueという名前で参照可能
    // set {
    //   sideLength = newValue / 3.0
    // }
  }

  override func simpleDescription() -> String {
    return "An equilateral triangle with sides of length \(sideLength)."
  }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

// プロパティの値の計算は不要だが、値のセットの前後に処理を挟みたい場合にはwillSetとdidSetが利用可能
class TriangleAndSquare {
  var triangle: EquilateralTriangle {
    willSet {
      square.sideLength = newValue.sideLength
    }
    didSet {
      print("triangle's sideLength is now \(triangle.sideLength)")
    }
  }
  var square: Square {
    willSet {
      triangle.sideLength = newValue.sideLength
    }
    didSet {
      print("square's sideLength is now \(square.sideLength)")
    }
  }
  init(size: Double, name: String) {
    square = Square(sideLength: size, name: name)
    triangle = EquilateralTriangle(sideLength: size, name: name)
  }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
