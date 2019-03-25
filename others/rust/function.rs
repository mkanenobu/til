fn main(){
    println!("main");
    print_number(13);
    print_sum(3, 4);
    println!("{}", add_one(3));
    // 関数ポインタ
    let f: fn(i32) -> i32;
    f = add_one;
    println!("{}", f(10));

    // panic
    diverges();
}

fn print_number(x: i32) {
    println!("x is: {}", x);
}

fn print_sum(x: i32, y: i32) {
    println!("sum is: {}", x + y);
}

fn add_one(x: i32) -> i32 {
    // x + 1; だと文として扱われ、戻り値がなくなるのでエラー
    x + 1
}

fn diverges() -> ! {
    // panic!は値を返さず、「!」型を持つ
    panic!("This function never returns!")
}

