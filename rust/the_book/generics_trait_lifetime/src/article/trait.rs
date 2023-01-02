/**
https://doc.rust-jp.rs/book-ja/ch10-02-traits.html
**/

// トレイトは他の言語でインターフェースと呼ばれるものと似ている
pub fn main() {
    let article = NewsArticle {
        headline: String::from("Penguins win the Stanley Cup Championship!"),
        location: String::from("Pittsburgh, PA, USA"),
        author: String::from("Iceburgh"),
        content: String::from(
            "The Pittsburgh Penguins once again are the best \
             hockey team in the NHL.",
        ),
    };
    let tweet = Tweet {
        username: String::from("horse_ebooks"),
        content: String::from("of course, as you probably already know, people"),
        reply: false,
        retweet: false,
    };
    println!("1 new article: {}", article.summarize());
    println!("1 new tweet: {}", tweet.summarize());

    notify(&article);
    notify(&tweet);

    printable();
}

// 引数に特定のトレイトを実装している型を取ることが出来る
pub fn notify(item: &impl Summary) {
    println!("Breaking news! {}", item.summarize());
}
// ↑は↓（トレイト境界）のシンタックスシュガー
pub fn notify2<T: Summary>(item: &T) {
    println!("Breaking news! {}", item.summarize());
}

pub fn notify_two_items(item1: &impl Summary, item2: &impl Summary) {}
// ↑は item1 と item2 に異なる型を取れるが、↓は item1 と item2 に同じ型であることを強制する
pub fn notify_two_items2<T: Summary>(item1: &T, item2: &T) {}

use std::fmt::Display;
// item は Summary と Display の両方を実装している必要がある
pub fn notify_display(item: &(impl Summary + Display)) {}

use std::fmt::Debug;
fn some_function<T: Display + Clone, U: Clone + Debug>(t: &T, u: &U) -> i32 {
    1
}
fn some_function2<T, U>(t: &T, u: &U) -> i32
// 複数のトレイト境界を持つと関数のシグネチャが読みづらくなる場合もあるので where 句を使用することも出来る
where
    T: Display + Clone,
    U: Clone + Debug,
{
    1
}

// トレイトを実装するにはトレイトか対象の型が自分のクレートに対して固有である必要がある
// つまり外部のトレイトを外部の型に対して実装することはできない
pub trait Summary {
    fn summarize_author(&self) -> String;

    // トレイトのメソッドはデフォルト実装を持てる
    fn summarize(&self) -> String {
        // デフォルト実装からデフォルト実装の無い他のメソッドを呼び出すこともできる
        format!("(Read more from {}...)", self.summarize_author())
    }
}

pub struct NewsArticle {
    pub headline: String,
    pub location: String,
    pub author: String,
    pub content: String,
}

impl Summary for NewsArticle {
    fn summarize_author(&self) -> String {
        format!("@{}", self.author)
    }
}

pub struct Tweet {
    pub username: String,
    pub content: String,
    pub reply: bool,
    pub retweet: bool,
}

// トレイトを実装する
impl Summary for Tweet {
    fn summarize_author(&self) -> String {
        format!("@{}", self.username)
    }

    // オーバーライドしている実装からデフォルト実装を呼び出すことは出来ない
    fn summarize(&self) -> String {
        format!("{}: {}", self.username, self.content,)
    }
}

// 戻り値にもトレイトを使用することが出来る
// これは Summary を実装している任意の型を返せるが、複数の型を返せる訳では無い
fn returns_summarizable() -> impl Summary {
    Tweet {
        username: String::from("horse_ebooks"),
        content: String::from("of course, as you probably already know, people"),
        reply: false,
        retweet: false,
    }
}

// トレイト境界を利用してメソッドの実装を場合分けすることも出来る
struct Pair<T> {
    x: T,
    y: T,
}
impl<T> Pair<T> {
    // new はいつでも使用できる
    fn new(x: T, y: T) -> Self {
        Self { x, y }
    }
}
impl<T: Display + PartialOrd> Pair<T> {
    // cmp_display は T が Display + PartialOrd を実装している場合のみ使用できる
    fn cmp_display(&self) {
        if self.x >= self.y {
            println!("The largest member is x = {}", self.x);
        } else {
            println!("The largest member is y = {}", self.y);
        }
    }
}

// 別のトレイトを実装するあらゆる型に対するトレイト実装を条件分けすることも出来る（ブランケット実装）
// これは標準ライブラリ内で広く使用されており、Display トレイトを実装するあらゆる型に ToString が実装されている
// 標準ライブラリの impl ブロックはこのような感じ
// impl<T: Display> ToString for T {
//     fn to_string(&self) -> String {...}
// }
// これによって標準ライブラリ内では Displayトレイトを実装する任意の型に対して、ToString トレイトで定義された to_string メソッドを呼び出すことができる

// Display トレイトを実装するあらゆる型に print メソッドを実装する例
pub trait Printable {
    fn print(&self);
}

impl<T: Display> Printable for T {
    fn print(&self) {
        println!("{}", self);
    }
}

fn printable() {
    "Hello, World!".print();
}
