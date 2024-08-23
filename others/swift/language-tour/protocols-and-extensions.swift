// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/guidedtour/#Protocols-and-Extensions

// プロトコルを定義
// プロトコルは他の言語におけるインターフェースに近い
protocol ExampleProtocol {
  var simpleDescription: String { get }
  mutating func adjust()
}

// クラス・Enum・Structは全てプロトコルを適用可能
// クラスに適用
class SimpleClass: ExampleProtocol {
  var simpleDescription: String = "A very simple class."
  // プロトコルの定義にないプロパティやメソッドがあってもプロトコルの実装関係に問題はない
  var anotherProperty: Int = 69105
  func adjust() {
    simpleDescription += " Now 100% adjusted."
  }
}
var a = SimpleClass()
a.adjust()
print(a.simpleDescription)

// Structに適用
struct SimpleStruct: ExampleProtocol {
  var simpleDescription: String = "A simple structure"
  // Structを変更するメソッドをマークするためにmutatingキーワードを使う
  // クラスのメソッドは常にクラスを変更出来るのでmutatingは不要
  mutating func adjust() {
    simpleDescription += " (adjusted)"
  }
}
var b = SimpleStruct()
b.adjust()
print(b.simpleDescription)

// Enumはプロパティを持てないので ExampleProtocol は実装できない

// Extensions
// Extensionsは既存の型に新しいメソッドやcomputed propertyを追加する場合に使う
// Extensionsを使うと他の場所で宣言された型やライブラリやフレームワークからインポートした型にプロトコルを実装出来る
extension Int: ExampleProtocol {
  var simpleDescription: String {
    return "The number \(self)"
  }
  mutating func adjust() {
    self += 42
  }
}
print(7.simpleDescription)

// プロトコルを実装するだけではなく任意の実装が可能
extension Int {
  func toString() -> String {
    return String(self)
  }
}
print(type(of: 10.toString()))

// プロトコルは他の型と同様に利用可能で、例えば型は異なるが全て特定のプロトコルを実装するオブジェクトのコレクションを作成出来る
let protocolValue: any ExampleProtocol = a
print(protocolValue.simpleDescription)
// aにはanotherPropertyが実装されているが、ExampleProtocolには含まれないので参照出来ない
// print(protocolValue.anotherProperty)
let collection: [ExampleProtocol] = [a, b]
collection.forEach({ print($0.simpleDescription) })
