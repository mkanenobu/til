pub fn run() void {
    opaqueExample();
}

// opaque 型はサイズとアラインメントが不明（0ではない）
// そのため直接データ型を格納出来ない
// これは情報の無い型へのポインタとして利用して型安全性を維持するためにある
// 主に完全な型情報を提供しないCのコードとの相互運用のために利用されることが多い
const Window = opaque {
    // struct, enum, union と同様にメソッドや値を定義できる
    fn show(self: *Window) void {
        show_window(self);
    }
    var x: u32 = 0;
};
const Button = opaque {};

fn opaqueExample() void {
    const main_window: *Window = undefined;
    show_window(main_window);

    const ok_button: *Button = undefined;
    // show_window(ok_button); // エラー
    _ = ok_button;
}

// Cの関数を呼び出す（実際にはこのようなものは無いのでエラーになる）
// extern fn show_window(*Window) callconv(.C) void;
fn show_window(_: *Window) void {}
