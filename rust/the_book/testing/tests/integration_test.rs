extern crate testing;
// src/lib.rs は extern crate で呼び出せるが、バイナリクレートの src/main.rs は呼び出せない
// そのため src/main.rs は src/lib.rs で定義したものを呼び出すだけの構成が取られることが多い

mod common;

// tests/ 以下は特別扱いされるので #[cfg(test)] などは必要ない
#[test]
fn larger_can_hold_smaller() {
    common::setup();

    let larger = testing::Rectangle {
        width: 8,
        height: 7,
    };
    let smaller = testing::Rectangle {
        width: 5,
        height: 1,
    };

    assert!(larger.can_hold(&smaller));
}
