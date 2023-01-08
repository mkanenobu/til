use std::convert::From;

fn main() {
    from_into();
    try_from_try_into();
    to_string();
    string_to();
}

#[derive(Debug)]
struct MyNumber {
    #[allow(dead_code)]
    value: i32,
}
// From トレイトはある型に対して、別の型からその型への変換を定義する
// i32 から MyNumber への From トレイトの実装
impl From<i32> for MyNumber {
    fn from(v: i32) -> Self {
        MyNumber { value: v }
    }
}
impl From<f64> for MyNumber {
    fn from(v: f64) -> Self {
        MyNumber { value: v as i32 }
    }
}

fn from_into() {
    let my_number = MyNumber::from(30i32);
    println!("my_number is {:?}", my_number);

    // Into トレイトは From トレイトの逆の動きをする（ある型から From トレイトを実装する型への変換）
    // From トレイトが実装されていれば必要に応じて自動でそれを使う
    // Into トレイトを使用するとほとんどの場合コンパイラが型を決定出来ないので変換先の型を明示する必要がある
    let my_number: MyNumber = 5.into();
    println!("my_number is {:?}", my_number);

    let my_number: MyNumber = (3.14f64).into();
    println!("my_number is {:?}", my_number);
}

use std::convert::TryFrom;

#[derive(Debug, PartialEq)]
struct EvenNumber(i32);
// TryFrom トレイトは失敗する可能性のある型変換に用いられる
impl TryFrom<i32> for EvenNumber {
    type Error = ();

    fn try_from(value: i32) -> Result<Self, Self::Error> {
        if value % 2 == 0 {
            Ok(EvenNumber(value))
        } else {
            Err(())
        }
    }
}

fn try_from_try_into() {
    assert_eq!(EvenNumber::try_from(8), Ok(EvenNumber(8)));
    assert_eq!(EvenNumber::try_from(5), Err(()));

    let result: Result<EvenNumber, ()> = 8i32.try_into();
    assert_eq!(result, Ok(EvenNumber(8)));
    let result: Result<EvenNumber, ()> = 5i32.try_into();
    assert_eq!(result, Err(()));
}

// String への変換を実装するのは簡単で ToString トレイトを実装するだけ
// 実際には fmt::Display トレイトを実装するのが良い
use std::fmt;
impl fmt::Display for MyNumber {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "MyNumber is {}", self.value)
    }
}
fn to_string() {
    let my_number = MyNumber::from(30i32);
    println!("{}", my_number.to_string());
}

// 文字列を解析して任意の型に変換するためには parse 関数を使用する
// parse 関数は指定された型に FromStr トレイトが実装されていれば、文字列をその型に変換する
use std::str;
impl str::FromStr for MyNumber {
    type Err = ();

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        match s.parse::<i32>() {
            Ok(v) => Ok(MyNumber { value: v }),
            Err(_) => Err(()),
        }
    }
}
fn string_to() {
    // parse 関数を利用する時、型を推論出来るようにするか turbofish 構文を使用して型を指定する
    let my_number = "3".parse::<MyNumber>().unwrap();
    println!("{}", my_number);
    let my_number: MyNumber = "40".parse().unwrap();
    println!("{}", my_number);
}
