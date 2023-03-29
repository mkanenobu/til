extern crate rand;

mod ignore_macro;

use rand::Rng;

fn main() {
    with_allow_attr();
    with_assign();
    with_macro();
}

#[allow(unused_must_use)]
fn with_allow_attr() {
    random_fail();
}

fn with_macro() {
    ignore!(random_fail());
}

fn with_assign() {
    // 変数 `_` は代入の対象にしか使えない
    let _ = random_fail();
}

fn random_fail() -> Result<f64, String> {
    let mut rng = rand::thread_rng();
    let n = rng.gen_range(0.0..1.0);
    if n < 0.5 {
        Ok(n)
    } else {
        Err("random fail".to_string())
    }
}
