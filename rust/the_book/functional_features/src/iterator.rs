pub fn iterator() {
    let v1 = vec![1, 2, 3];
    // Rust のイテレータは lazy なのでイテレータを生成するだけでは特に何も起こらない
    let v1_iter = v1.iter();

    for v in v1_iter {
        println!("Got: {}", v);
    }

    let mut v1_iter = v1.iter();
    // next メソッドはイテレータの内部ポインタの位置を一つ進めて値の不変参照を返す
    // イテレータの状態を変えるのでイテレータは可変である必要がある
    // ↑の for 文はループが所有権を奪って陰で可変にしている
    assert_eq!(v1_iter.next(), Some(&1));

    // 可変参照を取りたい時には iter_mut を使う
    let mut v1 = vec![1, 2, 3];
    let mut v1_iter = v1.iter_mut();
    v1_iter.next().and_then(|v| {
        *v *= 10;
        Some(v)
    });
    println!("{:?}", v1);

    // 所有権を奪った値を返したい時は into_iter を使う
    let v1 = vec![1, 2, 3];
    let mut v1_iter = v1.into_iter();
    assert_eq!(v1_iter.next(), Some(1));
}
