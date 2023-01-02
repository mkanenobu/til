pub fn main() {
    let mut count = 0u32;
    println!("Let's count until infinity!");

    let last_count = loop {
        count += 1;
        if count == 3 {
            println!("three");
            continue;
        }
        println!("{}", count);

        if count == 5 {
            println!("OK, that's enough");
            // break のあとに値を置くとそれが loop 式の値になる
            break count;
        }
    };
    println!("The last count is {}", last_count);
}
