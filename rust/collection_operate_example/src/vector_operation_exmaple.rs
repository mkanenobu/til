pub fn vector_operation_example() {
    vector_operation();
}

fn vector_operation() {
    let mut v = vec![5, 4, 3, 2, 1];
    // to Iter
    println!("{:#?}", v.iter());
    // Map
    println!("{:#?}", &v.iter().map(|el| el * 2).collect::<Vec<i32>>());
    // iter_mut
    v.iter_mut().for_each(|el| *el *= 3);
    println!("{:#?}", v);
}
