fn main() {
    let print = |v: i32| { println!("{}", v) };
    print(1);
    print(2);
    print(3);

    let add_one = |v: i32| -> i32 { v + 1 };
    println!("{}", add_one(1));
    println!("{}", add_one(2));
}
