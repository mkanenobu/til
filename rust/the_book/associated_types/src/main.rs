fn main() {
    associated_types();
}

/**
関連型（associated type）はトレイトのメソッド定義がシグネチャでプレースホルダの型を使用できるように、
トレイトと型のプレースホルダを結びつける
**/

struct Counter {
    count: i32,
    max: i32,
}

impl Iterator for Counter {
    // Iterator トレイトには Item のプレースホルダ型が定義されており、他のメソッドのシグネチャに使用されている
    // そのため Iterator トレイトを実装する型は Item 型の取る具体的な型を定義する必要がある
    type Item = i32;

    fn next(&mut self) -> Option<Self::Item> {
        if self.count < self.max {
            self.count += 1;
            Some(self.count)
        } else {
            None
        }
    }
}

#[derive(Debug)]
struct MyCollection {
    value: Vec<i32>,
}

impl IntoIterator for MyCollection {
    type Item = i32;
    type IntoIter = std::vec::IntoIter<Self::Item>;

    fn into_iter(self) -> Self::IntoIter {
        self.value.into_iter()
    }
}

fn associated_types() {
    let counter = Counter { count: 0, max: 5 };
    for i in counter {
        println!("{}", i);
    }

    let counter = Counter { count: 0, max: 3 };
    let v: Vec<i32> = counter.collect();
    println!("{:?}", v);

    let my_collection = MyCollection {
        value: vec![5, 7, 13],
    };
    let v: Vec<i32> = my_collection.into_iter().collect();

    println!("{:?}", v);
    let my_collection = MyCollection {
        value: vec![5, 7, 13],
    };
    println!("{:?}", my_collection.into_iter().sum::<i32>());

    let v = vec![1, 2, 3];
    v.iter();
}
