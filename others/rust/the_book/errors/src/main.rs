fn main() {
    // panic! は回復不能なエラーを起こす
    // panic!("crush and burn");

    if let Ok(s) = question_operator() {
        println!("s = {}", s);
    };
    useful_shortcut();
    rescuable_error();
}

use std::fs::File;
use std::io::ErrorKind;

fn rescuable_error() {
    let f = File::open("hello.txt");
    let f = match f {
        Ok(file) => file,
        // ファイルが無いという理由で File::open に失敗した場合は新規作成する
        // if ~ の部分はマッチガードと呼ばれる
        // ref はガードの式に error がムーブされないために必要
        // パターンにおいて `&` は参照にマッチして値を返すが、 `ref` は値にマッチして参照を返す
        Err(ref error) if error.kind() == ErrorKind::NotFound => match File::create("hello.txt") {
            Ok(fc) => fc,
            Err(e) => panic!("Tried to create file but there was a problem: {:?}", e),
        },
        // それ以外の場合には panic! を発生させる
        Err(err) => {
            panic!("There was a problem opening the file: {:?}", err)
        }
    };
}

fn useful_shortcut() {
    // unwrap は Result の値が Ok であればその中身を返し、Err であれば panic! を発生させる
    let f = File::open("hello.txt").unwrap();
    // これと同じ
    // let f = match File::open("hello.txt") {
    //     Ok(file) => file,
    //     Err(error) => panic!(error),
    // };

    // expect は unwrap と同じだが、エラー時に panic! に渡すメッセージを指定できる
    let f = File::open("hello.txt").expect("Failed to open hello.txt");
}

use std::io;
use std::io::Read;

// エラーの移譲
fn read_username_from_file() -> Result<String, io::Error> {
    let f = File::open("hello.txt");

    let mut f = match f {
        Ok(file) => file,
        // エラーが発生した場合そのエラーをそのまま返す
        Err(e) => return Err(e),
    };

    let mut s = String::new();

    match f.read_to_string(&mut s) {
        Ok(_) => Ok(s),
        Err(e) => Err(e),
    }
}

fn question_operator() -> Result<String, io::Error> {
    let mut f = File::open("hello.txt")?;
    // ?演算子は↓の match 式とほぼ同じ挙動をするが一部違いがあり、From トレイトで定義された from 関数を通る
    // from 関数は発生したエラーを関数の戻り値のエラーの型と合わせてくれる
    // ?演算子は Result を返す関数の中でしか使用出来ない
    // let mut f = match File::open("hello.txt") {
    //     Ok(file) => file,
    //     Err(e) => return Err(e),
    // };

    let mut buf = String::new();
    f.read_to_string(&mut buf)?;
    Ok(buf)
}
