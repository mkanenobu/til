fn main(){
    let a = 3;
    let _b = a + 4;

    println!("{}", a); // alive
    let _c = a;
    println!("{}", a); // alive
}
