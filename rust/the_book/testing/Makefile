test:
	cargo test

test_serial:
	cargo test -- --test-threads=1

# デフォルトでは標準出力に出力されたものを全てキャプチャする
# fail した場合には flush されるが pass した場合は表示されない
# nocapture フラグを付けると標準出力をキャプチャしない
test_nocapture:
	cargo test -- --nocapture --test-threads=1

test_specified:
	cargo test larger_can_hold_smaller

# #[ignore] が付いたテストのみ実行
test_ignored:
	cargo test -- --ignored