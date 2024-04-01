const debug = @import("std").debug;

pub fn run() void {
    outOfIndex();
    unreachableCode();
}

fn outOfIndex() void {
    // ランタイムセーフティーの機能で↓は通常ならコンパイルが通らないが、組み込み関数で現在のブロックのランタイムセーフティーを無効化できる
    @setRuntimeSafety(false);
    const a = [3]u8{ 1, 2, 3 };
    var index: u8 = 5;
    // 使わないのでランタイムでもエラーにはならない
    const b = a[index];
    _ = b;
}

fn unreachableCode() void {
    const x: i32 = 1;
    // unreachableで特定の分岐に到達しないことをコンパイラに伝えることが出来る、オプティマイザはそれを利用出来る
    const y: u32 = if (x == 1) 5 else unreachable;
    _ = y;

    debug.print("a to Upper == A: {}\n", .{asciiToUpper('a') == 'A'});
    debug.print("A to Upper == A: {}\n", .{asciiToUpper('A') == 'A'});
}

fn asciiToUpper(x: u8) u8 {
    return switch (x) {
        'a'...'z' => x + 'A' - 'a',
        'A'...'Z' => x,
        else => unreachable,
    };
}
