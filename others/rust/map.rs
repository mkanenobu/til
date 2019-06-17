fn each_by5(v: Vec<i32>) -> Vec<i32> {
    v.into_iter().map(|e| e * 5).collect()
}

fn main(){
    let v1 = vec![1,2,3,4,5];
    let v2 = each_by5(v1);
    println!("{:?}", v2);
}
