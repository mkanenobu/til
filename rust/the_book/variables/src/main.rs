fn main() {
    let x = 5;
    // mutable ではない変数は再代入は出来ないが（同じスコープでも）シャドーイングすることは出来る
    let x = x + 1;

    {
        let x = x * 2;
        println!("The value of x in the inner scope is: {}", x);
    }
    println!("The value of x is: {}", x);

    // シャドーイングは型を変えることも出来る
    let mut x = "string";
    println!("The value of x is: {}", x);
    // 型を変えることは出来ない
    // x = x.len();
}
