const debug = @import("std").debug;

// zigのOptionalのポインタはnullの場合に0値が使われるためメモリ効率がいい（ポインタに0やnullが使えないのはそのため）
pub fn main() void {
    // ?T でOptional型を表現できる
    var found_index: ?usize = null;
    const data = [_]i32{ 1, 2, 3, 4, 5 };
    for (data, 0..) |v, i| {
        if (v == 10) found_index = i;
    }
    // optionalをprintするときは `{?}` 指定子を使う
    debug.print("found_index: {?}\n", .{found_index});

    // orelse式
    // デフォルト値を渡して、Optionalを剥がす
    const a: usize = found_index orelse 0;
    debug.print("a: {}\n", .{a});

    // orelse unreachable で Optional をアンラップ出来る
    // .? はそのショートハンド
    const b: ?f32 = 5;
    const c = b orelse unreachable;
    const d = b.?;
    _ = .{ b, c, d };

    optionalPayloadCapture();
    whileNullCapture();
}

fn optionalPayloadCapture() void {
    const a: ?i32 = 5;
    if (a != null) {
        const value = a.?;
        _ = value;
    }

    var b: ?i32 = 5;
    // ペイロードキャプチャを使うと、Optional型の値や値のポインタを取得出来る
    // 値のポインタから値を変更することも出来る
    if (b) |*value| {
        value.* += 1;
    }
    debug.print("b: {?}\n", .{b});
}

var numbers_left: u32 = 4;
fn eventuallyNullSequence() ?u32 {
    if (numbers_left == 0) return null;
    numbers_left -= 1;
    return numbers_left;
}

fn whileNullCapture() void {
    var sum: u32 = 0;
    // whileでペイロードキャプチャを使う
    while (eventuallyNullSequence()) |value| {
        sum += value;
    }
    debug.print("sum: {}\n", .{sum});
}
