use std::thread::sleep;
use std::time::{Duration, Instant};

// ref: https://qiita.com/pseudo_foxkeh/items/5d5226e3ffa27631e80d
macro_rules! measure {
    ($x:expr) => {{
        println!("Measurement start.");
        let start = Instant::now();
        let result = $x;
        let end = start.elapsed();
        println!(
            "Elapsed {}.{:03}s.",
            end.as_secs(),
            end.subsec_nanos() / 1_000_000
        );
        result
    }};
}

fn main() {
    measure!({
        sleep(Duration::from_millis(1000));
        sleep(Duration::from_millis(1000));
    })
}
