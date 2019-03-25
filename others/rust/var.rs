fn main() {
    // imutable
    let n1 = 3;
    // n1 = 10; => error
    // mutable
    let mut n2 = 4;
    n2 = n2 + n1;
    println!("{}, {}", n1, n2);
}
