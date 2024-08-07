use criterion::{black_box, criterion_group, criterion_main, Criterion};
use sqids::Sqids;

fn bench(c: &mut Criterion) {
    let sqids = Sqids::default();

    c.bench_function("sqids", |b| b.iter(||{
        let e = sqids.encode(&[1]);
        black_box(e);
    }));
}