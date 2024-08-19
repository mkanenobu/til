// var は変数
var myVariable = 42
myVariable = 50
// let は定数
// コンパイル時に値が決まっている必要はない
let myConstant = 42

let implicitInt = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

// 暗黙的な型変換は行われないので、明示的に変換する必要がある
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
print(widthLabel)

// string interpolation
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

// 複数行文字列
let quotation = """
        Even though there's whitespace to the left,
        the actual lines aren't indented.
            Except for this line.
        Double quotes (") can appear without being escaped.

        I still have \(apples + oranges) pieces of fruit.
        """

// Array
var fruits = ["strawberries", "limes", "tangerines"]
fruits[1] = "grapes"

// Dictionary
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
 ]
occupations["Jayne"] = "Public Relations"

// 配列は要素を追加すると自動で長さが伸びる（可変長）
fruits.append("blueberries")
print(fruits)

// 型のArray, Dictionaryの初期化
fruits = []
occupations = [:]

// 型情報がない場合には明示する必要がある
let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]