fn main(){
    let mut range = 0..10;
    loop {
        // nextはOption<i32>を返す
        // 次の値があればSome(i32)が返り、次の値がなければNoneが返りループが終了する
        match range.next() {
            Some(x) => {
                println!("{}", x);
            },
            None => { break }
        }
    }

    let nums = vec![1,2,3];
    // not good
    // for i in 0..nums.len() {
    for i in &nums {
        println!("{}", i);
    }
}
