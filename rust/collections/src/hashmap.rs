use std::collections::HashMap;

pub fn hashmap() {
    let mut m: HashMap<&str, i32> = HashMap::new();
    m.insert("a", 1);
    m.insert("b", 2);

    println!("{:?}", m);
    println!("{:?}", m.get("b"));
    println!("{:?}", m.contains_key("c"));
}