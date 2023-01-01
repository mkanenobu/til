/**
https://doc.rust-jp.rs/book-ja/ch06-00-enums.html
**/

enum IpAddrKind {
    V4,
    V6,
}

enum IpAddr {
    V4(u8, u8, u8, u8),
    V6(String),
}

fn main() {
    enumerate();
    message();
    option();
    match_flow();
    match_option();
    if_let_pattern();
}

fn enumerate() {
    let home = IpAddr::V4(127, 0, 0, 1);
    let loopback = IpAddr::V6(String::from("::1"));
}

#[derive(Debug)]
enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(i32, i32, i32),
}
/**
↓のように別々に定義するより便利
struct QuitMessage;
struct MoveMessage {
    x: i32,
    y: i32,
}
struct WriteMessage(String);
struct ChangeColorMessage(i32, i32, i32);
**/
fn message() {
    let msg = Message::Write(String::from("hello"));
    msg.call();
}

// enum にもメソッドを実装出来る
impl Message {
    fn call(&self) {
        println!("{:?}", self);
    }
}

fn option() {
    let some_number = Some(5);
    let some_string = Some("a string");
    let absent_number: Option<i32> = None;
    println!("{:?} {:?} {:?}", some_number, some_string, absent_number);
}

fn match_flow() {
    println!("one dime is {} cents", value_in_cents(Coin::Dime));
}
enum Coin {
    Penny,
    Nickel,
    Dime,
    Quarter,
}

fn value_in_cents(coin: Coin) -> u32 {
    match coin {
        Coin::Penny => 1,
        Coin::Nickel => 5,
        Coin::Dime => 10,
        Coin::Quarter => 25,
    }
}

fn match_option() {
    let some_number = Some(5);
    println!("{:?}", plus_one(some_number));
    println!("{:?}", plus_one(None));

    println!("{}", count_number(3));
    println!("{}", count_number(10));
}

fn plus_one(x: Option<i32>) -> Option<i32> {
    match x {
        // match は enum の全ての可能性を網羅する必要がある
        None => None,
        Some(i) => Some(i + 1),
    }
}

fn count_number(n: i32) -> String {
    match n {
        1 => String::from("one"),
        2 => String::from("two"),
        3 => String::from("three"),
        // _ は全ての値にマッチする
        _ => String::from("many"),
    }
}

fn if_let_pattern() {
    let some_u8_value = Some(0u8);
    // 3の場合にしか関心がないが match 式だと長い
    match some_u8_value {
        Some(3) => println!("three"),
        _ => (),
    }
    // そのため if-let パターンがある、意味は上と同じ
    if let Some(3) = some_u8_value {
        println!("three");
    }
}
