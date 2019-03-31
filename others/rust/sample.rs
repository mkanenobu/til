// global variable
static N: i32 = 123;
fn main(){
    let x = (1, 1, 3);
    println!("{:?}", x);
    println!("{:?}", N);

    for i in 0..10 {
        let n = i;
        println!("{}", n);
    }
}
