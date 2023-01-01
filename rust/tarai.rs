fn tarai(x: i32, y: i32, z: i32) -> i32 {
    if x <= y {
        y
    } else {
        tarai(tarai(x - 1, y, z), tarai(y - 1, z, x), tarai(z - 1, x, y))
    }
}

fn main() {
    println!("{}", tarai(12, 6, 0));
}
