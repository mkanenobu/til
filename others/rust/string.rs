fn main(){
    let mut s: String = "Hello, ".to_string();
    s.push_str("World");
    println!("{}", s);
    s.push('!');
    println!("{}", s);
    s.pop();
    println!("{}", s);
}
