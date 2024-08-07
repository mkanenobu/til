mod bench;

use sqids::Sqids;
use chrono::prelude::*;

fn main() {
    println!("Hello, world!");
}

fn squids_bench() {
    let sqids = Sqids::default();

    for n in 1..101 {
        let id = sqids.encode();
    }
}