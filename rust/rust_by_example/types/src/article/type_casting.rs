// オーバーフローを起こすようなキャスティングによる警告を無視する。
#![allow(overflowing_literals)]

pub fn main() {
    basic();
    fit_unsigned();
    fit_signed();
}

fn basic() {
    // f32
    let decimal = 65.4321_f32;

    // 暗黙的な型変換は不可能
    // let integer: u8 = decimal;

    // 明示的な型変換
    let integer = decimal as u8;
    let character = integer as char;

    println!("Casting: {} -> {} -> {}", decimal, integer, character);
}

fn fit_unsigned() {
    // 何らかの値を unsigned な型にキャストすると、値が型に収まるように加算もしくは減算される

    // 1000 は u16 に収まるので変わらない
    println!("1000 as a u16 is: {}", 1000 as u16);

    // 最下位ビットから8bitが使用され、残りの上位ビットが圧縮される形になる
    // 1000 - 256 - 256 - 256 = 232
    println!("1000 as a u8 is : {}", 1000 as u8);
    // ↑正の数の場合、mod と同じ挙動
    println!("1000 mod 256 is : {}", 1000 % 256);

    // -1 + 256 = 255
    println!("  -1 as a u8 is : {}", (-1i8) as u8);
}

fn fit_signed() {
    // 符号付きの型にキャストする場合、結果は以下の2つを行った場合に等しい
    // 1. 対応する符号なしの型にキャストする
    // 2. 2の補数(two's complement)をとる

    // 収まるので変わらない
    println!(" 128 as a i16 is: {}", 128 as i16);
    // 128をu8にキャストすると128となる。128の8ビットにおける補数は -128
    println!(" 128 as a i8 is : {}", 128 as i8);
}
