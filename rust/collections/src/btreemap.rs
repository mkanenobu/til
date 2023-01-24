use std::cmp::{Ord, Ordering, PartialOrd};
use std::collections::BTreeMap;

// Ord を自前で実装する
#[derive(Debug)]
struct S {
    value: i32,
}

impl Ord for S {
    fn cmp(&self, other: &Self) -> Ordering {
        self.value.cmp(&other.value)
    }
}

impl PartialOrd for S {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}

impl Eq for S {}

impl PartialEq for S {
    fn eq(&self, other: &Self) -> bool {
        self.value == other.value
    }
}

// Ord を derive する
#[derive(Debug, Ord, Eq, PartialOrd, PartialEq)]
struct T {
    value: i32,
}

pub fn btreemap() {
    // BTreeMap はキーが　Ord を実装している必要がある
    // インターフェースは HashMap とほぼ同じ
    let mut btree_map: BTreeMap<S, i32> = BTreeMap::new();
    btree_map.insert(S { value: 1 }, 1);
    btree_map.insert(S { value: 3 }, 3);
    btree_map.insert(S { value: 2 }, 2);
    println!("{:?}", btree_map);

    let mut btree_map: BTreeMap<T, i32> = BTreeMap::new();
    btree_map.insert(T { value: 1 }, 1);
    btree_map.insert(T { value: 3 }, 3);
    btree_map.insert(T { value: 0 }, 0);
    println!("{:?}", btree_map);
    btree_map
        .iter()
        .for_each(|(k, v)| println!("{:?}, {:?}", k, v));

    let double = |v: i32| v * 2;
    let doubled_values = btree_map
        .iter()
        .map(|(_k, v)| double(v.clone()))
        .collect::<Vec<i32>>();
    println!("Doubled values: {:?}", doubled_values);
}
