fn main(){
    let n: i32 = 100;
    // cast
    let f: f32 = 123.0 / (n as f32);
    println!("{}", f);

    let s = "123.456";
    // OK(123.456)をunwrap
    println!("{}", s.parse::<f64>().ok().unwrap());
}
