// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/guidedtour/#Enumerations-and-Structures

// Enum定義
// Enumにもメソッドを生やせる
enum Rank: Int {
  // デフォルトでは0から始まって1づつインクリメントする値を割り当てるが、明示的に値を指定することも可能
  // この場合は最初のaceに1を割り当てているので1から始まって1づつインクリメントする値が割り当てられる
  // 割り当てられた値はrawValueで取得可能
  case ace = 1
  case two, three, four, five, six, seven, eight, nine, ten
  case jack, queen, king

  func simpleDescription() -> String {
    switch self {
    case .ace:
      return "ace"
    case .jack:
      return "jack"
    case .queen:
      return "queen"
    case .king:
      return "king"
    default:
      return String(self.rawValue)
    }
  }

  func isGreaterThan(_ other: Rank) -> Bool {
    return self.rawValue > other.rawValue
  }
}

// rawValueからEnumのインスタンス化
// 一致するものがなければnilが返る
if let convertedRank = Rank(rawValue: 3) {
  print(convertedRank.simpleDescription())
}
print("14: ", Rank(rawValue: 14) as Any)
print("ace is greater than king?: ", Rank.ace.isGreaterThan(Rank.king))

// rawValueは不要なら指定する必要も取り扱う必要もない（暗黙的に持ってはいる）
enum Suit {
  case spades, hearts, diamonds, clubs

  func simpleDescription() -> String {
    switch self {
    case .spades:
      return "spades"
    case .hearts:
      return "hearts"
    case .diamonds:
      return "diamonds"
    case .clubs:
      return "clubs"
    }
  }

  func color() -> String {
    switch self {
    case .spades, .clubs:
      return "black"
    case .hearts, .diamonds:
      return "red"
    }
  }
}
// 型が分かっていれば型（Enum）名を省略した記法を利用できる
let hearts: Suit = .hearts
let heartsDescription = hearts.simpleDescription()
print("\(heartsDescription) has \(hearts.color()) color")

// 値付きEnum
enum ServerResponse {
  // ラベルは省略可能
  // 省略すると初期化時も指定不要
  case result(sunrise: String, sunset: String)
  case failure(errorMessage: String)
}
let success = ServerResponse.result(sunrise: "6:00 am", sunset: "8:09 pm")
let failure = ServerResponse.failure(errorMessage: "Out of cheese.")
switch success {
case let .result(sunrise, sunset):
  print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
  print("Failure...  \(message)")
}

// Struct定義
// Structはクラスとほぼ同等の機能を持つが、構造体はコード内でパラメータとして渡されるときに常にコピーされる、クラスは常に参照として渡される
struct Card {
  var rank: Rank
  var suit: Suit

  func simpleDescription() -> String {
    return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
  }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
print(threeOfSpades.simpleDescription())
