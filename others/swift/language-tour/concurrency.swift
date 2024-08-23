// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/guidedtour/#Concurrency

import Foundation

// asyncキーワード
func fetchUserID(from server: String) async -> Int {
  if server == "primary" {
    return 97
  }
  return 501
}

func fetchUsername(from server: String) async -> String {
  // async functionの呼び出しにはawaitが必要
  let userID = await fetchUserID(from: server)
  if userID == 501 {
    return "John Appleseed"
  }
  return "Guest"
}

func connectUser(to server: String) async {
  // 待たずに取り回す場合にはasync letを使う
  async let userID = fetchUserID(from: server)
  async let username = fetchUsername(from: server)
  // fetchUserIDの結果を待つ前にfetchUsernameが走って、ここでawaitすることで両方を待つ
  let greeting = await "Hello \(username), user ID \(userID)"
  print(greeting)
}

// Taskは同期的なコードから非同期関数を呼び出すために使うが、関数の結果を待たない
// この例だと処理中に待つような処理がないのでTaskを使っていてもprintが実行される（途中にsleepなどを入れるとprintが行われる前にプロセスが終了する）
Task {
  await connectUser(to: "primary")
}

// タスクグループで複数の非同期関数を同時に実行する
// このコードでやっていることはJSのPromise.allに近い
let userIds = await withTaskGroup(of: Int.self) { group in
  for server in ["primary", "secondary", "development"] {
    group.addTask {
      return await fetchUserID(from: server)
    }
  }

  var results: [Int] = []
  for await result in group {
    results.append(result)
  }
  return results
}
print("userIds", userIds)

// Actorの定義
// Actorはクラスに似ているが、複数の異なる非同期関数が一つのActorに対して同時に安全にアクセス出来ることが保証される
actor ServerConnection {
  var server: String = "primary"
  private var activeUsers: [Int] = []

  func connect() async -> Int {
    let userID = await fetchUserID(from: server)
    // 実際の処理
    activeUsers.append(userID)
    return userID
  }
}

let server = ServerConnection()
// Actorのメソッドを呼び出したり、プロパティにアクセスするときには既に他の場所で実行されていた場合にその実行が終わるのを待つためにawaitが必要
let userID = await server.connect()
let s = await server.server
print("userID:", userID)
print("server:", s)
