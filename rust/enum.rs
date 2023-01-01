// rustのenumはいくつかのヴァリアントのうちどれか１つをとるデータを表す型
enum Message {
    Quit,
    ChangeColor(i32, i32, i32),
    Move { x: i32, y: i32 },
    Write(String),
}

// 各ヴァリアントの名前を使うには::構文を使用する
// ヴァリアントの名前はenum自体の名前によってスコープ化されている
let x: Message = Message::Move { x: 3, y: 4 };

enum BoardGameTurn {
    Move { squares: i32 },
    Pass,
}

// スコープが違うので同じMoveという名前でも衝突しない
let y: BoardGameTurn = BoardGameTurn::Move { squares: 1 };
