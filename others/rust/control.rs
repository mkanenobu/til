fn main(){
    // if
    let t: bool = true;
    let f: bool = false;

    if t {
        println!("true");
    }

    if f {
        // 
    } else {
        println!("false");
    }

    if t && true {
        println!("true");
    }

    if f || false {
        println!("false");
    }

    // pattern match
    let n: i16 = 1;
    match n {
        0 => println!("zero"),
        1 => println!("one"),
        _ => println!("other")
    }
}
