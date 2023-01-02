pub fn main() {
    iter();
    collection_to_iterator_iter();
    collection_to_iterator_into_iter();
    collection_to_iterator_iter_mut();
}

fn iter() {
    // for in 文はイテレータを取る
    // `a..b` は a から b の一つ前までの要素を順に yield するイテレータを返す
    for n in 1..21 {
        if n % 15 == 0 {
            println!("fizzbuzz");
        } else if n % 3 == 0 {
            println!("fizz");
        } else if n % 5 == 0 {
            println!("buzz");
        } else {
            println!("{}", n);
        }
    }

    // `a..=b` は a から b までの要素を順に yield するイテレータを返す
    for n in 1..=20 {
        if n % 15 == 0 {
            println!("fizzbuzz");
        } else if n % 3 == 0 {
            println!("fizz");
        } else if n % 5 == 0 {
            println!("buzz");
        } else {
            println!("{}", n);
        }
    }
}

// iter はコレクションに副作用を与えない
fn collection_to_iterator_iter() {
    let names = vec!["Bob", "Frank", "Ferris"];
    // name の型は &&str
    for name in names.iter() {
        match name {
            &"Ferris" => println!("There is a rustacean among us!"),
            _ => println!("Hello {}", name),
        }
    }

    println!("names: {:?}", names);
}

// into_iter はコレクションの所有権がムーブするのでコレクションを再利用出来なくなる
fn collection_to_iterator_into_iter() {
    let names = vec!["Bob", "Frank", "Ferris"];
    // name の型は &str
    for name in names.into_iter() {
        match name {
            "Ferris" => println!("There is a rustacean among us!"),
            _ => println!("Hello {}", name),
        }
    }

    // 所有権がループにムーブしているので names を再利用出来ない
    // println!("names: {:?}", names);
}

// iter_mut は各要素を可変で借用するのでコレクションの要素を変更できる
fn collection_to_iterator_iter_mut() {
    let mut names = vec!["Bob", "Frank", "Ferris"];
    // name の型は &mut &str
    for name in names.iter_mut() {
        *name = match name {
            &mut "Ferris" => "Ferris is a rustacean!",
            _ => "Hello",
        }
    }

    println!("names: {:?}", names);
}
