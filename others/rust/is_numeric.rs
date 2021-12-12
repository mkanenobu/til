fn is_numeric(s: &str) -> bool {
    s.parse::<f64>().is_ok()
}

fn main(){
    let s1 = "123.567";
    let s2 = "321";
    let s3 = "abc123";

    println!("{:?}", s1.parse::<f64>().is_ok());
    println!("{:?}", s2.parse::<f64>().is_ok());
    println!("{:?}", s3.parse::<f64>().is_ok());

    println!("{:?}", is_numeric(s1));
    println!("{:?}", is_numeric(s2));
    println!("{:?}", is_numeric(s3));
}
