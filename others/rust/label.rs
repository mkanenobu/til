fn main(){
    'outer: for i in 0..100 {
        'inner: for j in 0..100 {
            if i * j == 100 {
                println!("{}, {}", i, j);
                break 'inner
            } else if i * j == 300 {
                println!("over 300, end loop");
                break 'outer
            }
        }

    }
}
