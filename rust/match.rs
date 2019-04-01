fn main(){
    // pattern match
    for i in 0..10 {
        match i {
            0 => println!("zero"),
            1 => println!("one"),
            _ => println!("other")
        }
    }
}
