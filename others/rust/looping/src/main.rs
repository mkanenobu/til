fn _loop() {
    let mut i = 0;
    // infinite loop
    let loop_res = loop {
        i += 1;

        if i <= 5 {
            println!("loop, {}", i);
            continue;
        }

        println!("loop, {}", i);
        // break の後に置いたものが loop 式の評価値になる
        break true;
    };
    println!("loop result: {}", loop_res);
}

fn _while() {
    let mut i = 0;
    while i < 3 {
        i += 1;
        println!("while: {}", i)
    }
}

fn for_in() {
    // 0,1,2
    for n in 0..3 {
        println!("for in: {}", n);
    }
    // 0,1,2,3
    for n in 0..=3 {
        println!("for in: {}", n);
    }
}

fn iter() {
    let arr = [1, 2, 3, 4, 5];
    for n in arr.iter() {
        println!("iter: {}", n);
    }
}

fn main() {
    _loop();
    _while();
    for_in();
    iter();
}
