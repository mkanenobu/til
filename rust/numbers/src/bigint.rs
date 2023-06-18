use num_bigint::ToBigInt;

pub fn bigint() {
    let bigint = 1_000_000_000_000_000_002_i64.to_bigint().unwrap();
    println!("bigint {}", bigint);

    let bi2 = bigint.clone();
    println!("bigint * bigint = {}", bigint * bi2);
}
