// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/guidedtour/#Generics

// ジェネリクス関数を定義
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
  var result: [Item] = []
  for _ in 0..<numberOfTimes {
    result.append(item)
  }
  return result
}
// 型が推論可能なら明示的な型指定は不要
print(makeArray(repeating: "knock", numberOfTimes: 4))

// クラス・Enum・Structでもジェネリクスを利用可能
enum OptionalValue<Wrapped> {
  case none
  case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

// whereで型の条件を指定可能
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
// Tのシーケンスの要素がEquatableであり、TとUの要素が同じ型であることを指定
where T.Element: Equatable, T.Element == U.Element {
  for lhsItem in lhs {
    for rhsItem in rhs {
      if lhsItem == rhsItem {
        return true
      }
    }
  }
  return false
}
print(anyCommonElements([1, 2, 3], [3]))
