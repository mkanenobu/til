pub fn main() {
    let n = 5;
    print!("{} is {}", n, sign(n));

    let big_n = if n < 10 && n > -10 {
        println!(", and is a small number, increase ten-fold");
        10 * n
    } else {
        println!(", and is a big number, halve the number");
        n / 2
    };

    println!("{} -> {}", n, big_n);
}

fn sign(n: i32) -> String {
    if n > 0 {
        "positive".to_string()
    } else if n < 0 {
        "negative".to_string()
    } else {
        "zero".to_string()
    }
}
