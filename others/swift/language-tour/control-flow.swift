let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
// for-loop と if 式
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

// ifは式で、条件は Boolean である必要がある
let scoreDecoration = if teamScore > 10 {
    "🎉"
} else {
    ""
}
print("Score:", teamScore, scoreDecoration)

// Optional、型の後ろに?をつける
var optionalString: String? = "Hello"
print(optionalString == nil) // -> false
var optionalString2: String? = nil
print(optionalString2 == nil) // -> true

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
// if-let で Optional の中身を取り出す
if let name = optionalName {
    greeting = "Hello, \(name)"
}

let nickname: String? = nil
let fullName: String = "John Appleseed"
// Optional を剥がすもう一つの方法は ?? でデフォルト値を指定する
// `nickname ?? fullName`` の式の返却値の型は String
let informalGreeting = "Hi \(nickname ?? fullName)"

// if-let は名前を省略して Optional の変数名のまま中身を使うことも出来る
// （nickname は nil なので何も出力されない）
if let nickname {
    print("Hey, \(nickname)")
}

let vegetable = "red pepper"
// switch は等価性の検証だけではなく、多くの比較演算子をサポートしている
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    // ここに引っかかる
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

// for-in で Dictionary の KV を走査可能
// Dictionary には順番の概念が無いのでループの順番は保証されない
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var largestKey = ""
for (key, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestKey = key
        }
    }
}
print(largest, largestKey)
