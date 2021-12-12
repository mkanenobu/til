fn main(){
    const N: usize = 10;
    // standard array
    let arr = [1.2; N];
    println!("{}", arr[0]);

    // vector
    // Vec::new()かvec![]マクロで初期化
    let vec1: Vec<i32> = vec![1,2,3];

    let mut vec2: Vec<i32> = Vec::new();
    vec2.push(30);
    println!("{:?}, {:?}", vec1, vec2);

    // with_capacityでN個分の連続した領域を確保する
    let mut vec3: Vec<f64> = Vec::with_capacity(N);
    vec3.push(3.14);

    println!("{} {}", vec3[0], vec3.len());

    // box
    let b = Box::new(N);
    println!("{}", b);
}
