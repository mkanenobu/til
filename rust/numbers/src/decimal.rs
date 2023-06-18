use rust_decimal_macros::dec;

pub fn decimal() {
    let float = 0.1_f64 * 0.1_f64;
    let decimal = dec!(0.1) * dec!(0.1);
    println!("0.1 * 0.1 =");
    println!("f64 {}", float);
    println!("decimal {}", decimal);
}
