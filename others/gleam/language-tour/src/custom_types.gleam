import gleam/io

// 各バリアントのコンストラクタを渡してカスタムタイプを作成する
pub type Season {
  Spring
  Summer
  Autumn
  Winter
}

// レコード
// カスタムタイプのバリアントはデータを保持出来る
pub type SchoolPerson {
  Teacher(name: String, subject: String)
  Student(String)
}

pub type SchoolPerson2 {
  Teacher2(name: String, subject: String)
  Student2(name: String)
}

pub type SchoolPerson3 {
  Teacher3(name: String, subject: String, floor: Int, root: Int)
}

// カスタムタイプにもジェネリクスが利用できる
// （これと同じものがgleam/optionモジュールにある）
pub type Option(inner) {
  Some(inner)
  None
}

pub const name: Option(String) = Some("Alice")

pub const age: Option(Int) = None

pub fn custom_types() {
  io.debug("Custom Types")

  weather(Spring)
  |> io.debug
  weather(Summer)
  |> io.debug
  weather(Autumn)
  |> io.debug
  weather(Winter)
  |> io.debug

  // コンストラクタ呼び出すときはラベルを付けてもいいし付けなくてもいい（一部だけ付けることは出来ない）
  let teacher1 = Teacher("John", "Math")
  let teacher2 = Teacher(name: "Adam", subject: "Physics")
  let student1 = Student("Alice")
  let student2 = Student("Bob")
  let school = [teacher1, teacher2, student1, student2]
  // コンストラクタは型としては利用出来ない
  // let teachers: List(Teacher) = [teacher1, teacher2] // エラー
  io.debug(school)

  // レコードアクセサ
  // レコードアクセサは全てのバリアントで同じ位置・同じ名前・同じ型のフィールドを持っているものにだけ利用できる
  let t2 = Teacher2(name: "John", subject: "Math")
  let s2 = Student2(name: "Alice")
  t2.name
  |> io.debug
  s2.name
  |> io.debug
  // t2.subject |> io.debug // エラー

  // レコードアップデート構文
  // レコードアップデート構文で既存のレコードから一部の値だけが更新された新しいレコードを作成出来る
  let t3 = Teacher3(name: "John", subject: "Math", floor: 3, root: 5)
  let t3_2 = Teacher3(..t3, floor: 4, root: 6)
  io.debug(t3_2)
  // バリアント間でフィールドに互換性がない場合は、同じコンストラクタからでもアップデート構文は利用できない
  // let t2_2 = Teacher2(..t2, subject: "Math") // エラー
}

fn weather(season: Season) -> String {
  case season {
    Spring -> "Mild"
    Summer -> "Hot"
    Autumn -> "Windy"
    Winter -> "Cold"
  }
}
