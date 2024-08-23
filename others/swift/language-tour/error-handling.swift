// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/guidedtour/#Error-Handling

// Errorプロトコルを実装するEnumを定義することでエラーを表現する
enum PrinterError: Error {
  case outOfPaper
  case noToner
  case onFire
}

// throwsキーワードはエラーをする可能性があることを表す
func send(job: Int, toPrinter printerName: String) throws -> String {
  if printerName == "Never Has Toner" {
    throw PrinterError.noToner
  }
  return "Job sent"
}

// エラーを処理する方法はいくつかあり、do-catch文を使う方法はその一つ
do {
  let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
  print(printerResponse)
} catch {
  // 明示的に名前を付けなければ暗黙的にerrorという名前でエラーが渡される
  print(error)
}

// catchの後にパターンを書くことでswitch-caseと同様に複数のcatchを書くことが出来る
do {
  let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
  print(printerResponse)
} catch PrinterError.onFire {
  print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
  print("Printer error: \(printerError).")
} catch {
  print(error)
}

// try?で結果をOptionに変換出来る
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
print("printerSuccess:", printerSuccess as Any)
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
print("printerFailure:", printerFailure as Any)

// deferキーワードを使うと関数の処理が終わった後に処理を実行することが出来る
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]
func fridgeContains(_ food: String) -> Bool {
  fridgeIsOpen = true
  defer {
    // 開けたら閉める
    // これは関数が終わるタイミングで実行されるので、fridgeContent.containsが走る時点では開いている
    fridgeIsOpen = false
  }

  let result = fridgeContent.contains(food)
  return result
}
if fridgeContains("banana") {
  print("Found a banana")
}
// print false
print(fridgeIsOpen)
