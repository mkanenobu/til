use anyhow::{anyhow, Error};
use std::convert::{From, TryFrom};

fn main() {
    from_into();
    try_from();
}

fn from_into() {
    let n = MyInt::from(64);
    println!("{:?}", n);
    match n {
        MyInt::Odd(n) => println!("odd: {}", n),
        MyInt::Even(n) => println!("even: {}", n),
    }
    // From トレイトを実装すると Into トレイトも実装される、変換の方向は同じ
    let n: MyInt = 11.into();
    println!("{:?}", n);
}

#[derive(Debug)]
enum MyInt {
    Odd(i32),
    Even(i32),
}

impl From<i32> for MyInt {
    fn from(value: i32) -> Self {
        if value % 2 == 0 {
            Self::Even(value)
        } else {
            Self::Odd(value)
        }
    }
}

fn try_from() {
    let odd_number = OddNumber::try_from(11);
    println!("{:?}", odd_number);
    println!("{:?}", odd_number.unwrap_or(OddNumber { value: 0 }).value);
    let odd_number: Result<OddNumber, _> = 10.try_into();
    println!("{:?}", odd_number);
}

#[derive(Debug)]
struct OddNumber {
    pub value: i32,
}

impl TryFrom<i32> for OddNumber {
    type Error = Error;

    fn try_from(value: i32) -> Result<Self, Self::Error> {
        if value % 2 == 1 {
            Ok(Self { value })
        } else {
            Err(anyhow!("Even number"))
        }
    }
}
