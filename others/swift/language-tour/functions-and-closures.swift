func greet(person: String, day: String) -> String {
  return "Hello \(person), today is \(day)."
}
print(greet(person: "Bob", day: "Tuesday"))

// デフォルトではパラメータ名が引数のラベルになるが、
// カスタムラベルを付けることも出来る
// _ はラベルを利用しない
func greet(_ person: String, on day: String) -> String {
  return "Hello \(person), today is \(day)."
}
print(greet("John", on: "Wednesday"))

// タプルで複数値を返す
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
  var min = scores[0]
  var max = scores[0]
  var sum = 0

  for score in scores {
    if score > max {
      max = score
    } else if score < min {
      min = score
    }
    sum += score
  }

  return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])

// 関数はネスト可能
func returnFifteen() -> Int {
  var y = 10
  func add() {
    y += 5
  }
  add()
  return y
}
print(returnFifteen())

// 関数はファーストクラスの型なので関数を返す関数を定義可能
func makeIncrementer() -> ((Int) -> Int) {
  func addOne(number: Int) -> Int {
    return 1 + number
  }
  return addOne
}
var incrementer = makeIncrementer()
print(incrementer(7))

// 同様に引数として関数を取ることも可能
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
  for item in list {
    if condition(item) {
      return true
    }
  }
  return false
}
func lessThanTen(number: Int) -> Bool {
  return number < 10
}
var numbers = [20, 19, 7, 12]
print(hasAnyMatches(list: numbers, condition: lessThanTen))

// クロージャ
// 関数の実態は特殊なクロージャ
var tripled = numbers.map({ (num: Int) -> Int in
  return 3 * num
})
print(tripled)
// クロージャにはいくつか記法がある
// コールバックなどで既に型が分かっている場合にはパラメータの型と戻り値の型を省略可能
// また単一の式の場合には暗黙的にその式の評価結果が戻り値になる
print(numbers.map({ n in 3 * n }))
// パラメータを名前ではなく番号で参照することも可能
// またクロージャが関数の唯一の引数である場合には括弧を省略可能
print("sorted: ", numbers.sorted { $0 > $1 })
