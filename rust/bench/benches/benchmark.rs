use criterion::{criterion_group, criterion_main, Criterion};

use lib::tarai;

fn bench(c: &mut Criterion) {
    c.bench_function("Tarai", |b| b.iter(|| tarai(13, 10, 0)));
}

criterion_group!(benches, bench);
criterion_main!(benches);
