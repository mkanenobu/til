/**
https://doc.rust-jp.rs/book-ja/ch10-00-generics.html
**/

pub fn main() {
    let number_list = vec![34, 50, 25, 100, 65];
    let result = largest(&number_list);
    println!("The largest number is {}", result);

    let number_list = vec![102, 34, 6000, 89, 54, 2, 43, 8];
    let result = largest(&number_list);
    println!("The largest number is {}", result);

    let char_list = vec!['y', 'm', 'a', 'q'];
    println!("The largest char is {}", largest(&char_list));

    point();
}

// 比較のために PartialOrd を、値をコピー出来るように Copy を実装した型を取る
// 返り値に参照（&T）を返すようにすれば Copy を実装している必要がなくなるので、そのようなリファクタも考えられる
fn largest<T: PartialOrd + Copy>(list: &[T]) -> T {
    let mut largest = list[0];

    for &item in list.iter() {
        if item > largest {
            largest = item;
        }
    }
    largest
}

struct Point<T> {
    x: T,
    y: T,
}

impl<T> Point<T> {
    fn x(&self) -> &T {
        &self.x
    }
    fn y(&self) -> &T {
        &self.x
    }
}

fn point() {
    let p1 = Point { x: 5, y: 10 };
    let p2 = Point { x: 0.1, y: 10.0 };
    println!("p1.x = {}", p1.x());
    println!("p2.y = {}", p2.y());
}
