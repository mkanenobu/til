fn main(){
    let a = vec![1,2,3,4,5];
    println!("{:?}", a);
    let b = a; // 所有権がaからbに移動
    println!("{:?}", b);
    // compile error: aはデータの所有権を失っている
    // println!("{:?}", a);

    let c: Vec<i32>;

    {
        let d = b;
        // println!("{:?}", b); // compile error
        println!("{:?}", d);
        c = d; // 所有権を移動しておかないとdが破棄されたときにデータも破棄される
    }
    println!("{:?}", c);
}
