fn main(){
    let s: &str = "foo";
    match &*s {
        "foo" => println!("matched"),
        _ => println!("unmatched"),
    }
}
