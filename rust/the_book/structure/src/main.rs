/**
https://doc.rust-jp.rs/book-ja/ch05-01-defining-structs.html
**/

// 構造体に #[derive(Debug)] をつけると {:?} や {:#?} で print 出来るようになる
#[derive(Debug)]
struct User {
    username: String,
    email: String,
    sign_in_count: u64,
    active: bool,
}

fn main() {
    structure();
    tuple_struct();
    rectangle();
}

fn structure() {
    // 構造体のインスタンスを生成
    let mut user1 = User {
        email: String::from("someone@example.com"),
        username: String::from("someusername123"),
        active: true,
        sign_in_count: 1,
    };
    println!("user1: {:?}", user1);
    // 構造体のフィールドにアクセスするにはドット記法を使う
    println!("user1.email: {}", user1.email);
    // 構造体のインスタンスが mutable ならフィールドを上書き可能
    // インスタンスが immutable ならフィールドも immutable で特定のフィールドだけ mutable にすることは出来ない
    user1.email = String::from("test@example.com");

    let user2 = User {
        email: String::from("user2@example.com"),
        username: String::from("someusername123"),
        active: true,
        sign_in_count: 1,
    };
    println!("user2: {:?}", user2);
    let disabled_user2 = disabled_user(user2);
    println!("disabled user2: {:?}", disabled_user2);
}

fn build_user(email: String, username: String) -> User {
    // (JSと同じように)初期化時に短縮記法が使用できる
    User {
        email,
        username,
        active: true,
        sign_in_count: 1,
    }
}

fn disabled_user(user: User) -> User {
    // 更新記法、明示的にセットしたフィールド以外は元の値を引き継ぐ
    User {
        active: false,
        ..user
    }
}

fn tuple_struct() {
    // タプル構造体、Color と Point は同様に3つの i32 で構成されるが違う型
    #[derive(Debug)]
    struct Color(i32, i32, i32);
    #[derive(Debug)]
    struct Point(i32, i32, i32);

    let black = Color(0, 0, 0);
    let origin = Point(0, 0, 0);
    println!("black: {:?}", black);
    println!("origin: {:?}", origin);
}

#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

fn rectangle() {
    let rect1 = Rectangle {
        width: 30,
        height: 50,
    };
    println!("rect1 is {:?}", rect1);
    println!(
        "The area of the rectangle is {} square pixels.",
        area(&rect1)
    );
    println!(
        "The area of the rectangle is {} square pixels.",
        rect1.area()
    );

    let rect2 = Rectangle {
        width: 10,
        height: 40,
    };
    let rect3 = Rectangle {
        width: 60,
        height: 45,
    };
    println!("Can rect1 hold rect2? {}", rect1.can_hold(&rect2));
    println!("Can rect1 hold rect3? {}", rect1.can_hold(&rect3));

    let square = Rectangle::square(3);
    println!("square: {:?}, square area: {}", square, square.area());
}

fn area(rect: &Rectangle) -> u32 {
    rect.width * rect.height
}

impl Rectangle {
    // メソッド記法
    fn area(&self) -> u32 {
        self.width * self.height
    }

    // self に other が入るか
    fn can_hold(&self, other: &Rectangle) -> bool {
        self.width > other.width && self.height > other.height
    }

    // self を取らない関連関数
    // Rectangle::square という感じで呼び出せる
    fn square(size: u32) -> Rectangle {
        Rectangle {
            width: size,
            height: size,
        }
    }
}
