pub fn slice_example() {
    let arr: [u8; 8] = [0; 8];
    print_slice_arg(&arr);
    // スライスは Array も Vector もどちらでも取れる
    let vec: Vec<u8> = vec![1, 2, 3];
    print_slice_arg(&vec);
}

// 引数にスライスを取る関数
// スライスはコレクションの一部の要素の参照、String と &str の関係と同じ
fn print_slice_arg(slice: &[u8]) {
    println!("slice: {:?}", slice);
}
