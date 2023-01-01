fn main(){
    // standard for
    for i in 0..10 {
        println!("{}", i);
    }

    // like foreach
    let l = [5,4,3,2,1];
    for i in l.iter() {
        println!("{}", i);
    }

    // while
    let mut i = 0;
    while i < 10 {
        println!("{}", i);
        i += 1;
    }

    // infinitie loop
    let mut n = 0;
    loop {
        println!("{}", n);
        n += 1;
        if n > 10 { break }
    }
}
