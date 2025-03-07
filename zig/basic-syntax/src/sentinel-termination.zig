const std = @import("std");
const debug = std.debug;
const expect = std.testing.expect;

pub fn main() void {
    // 配列やスライス、多くのポインタはその値の子の型で終了するケースがある
    // これはセンチネル終了として知られている
    // これらを表現するためには [N:t]T, [:t]T, [*:t]T という構文を使う（tはTの子タイプ）
    const terminated = [3:0]u8{ 3, 2, 1 };
    expect(terminated.len == 3) catch unreachable;
    // @ptrCastは安全ではない型変換に利用する
    // もとのデータの長さは3だが、文字列に変換すると、最後の要素の後に0バイト（ヌル文字）が存在していることが分かる
    expect(@as(*const [4]u8, @ptrCast(&terminated))[3] == 0) catch unreachable;

    // 文字列リテラルの型は *const [N:0]u8 になる（Nは文字列の長さ）
    const str = "Hello, World!";
    debug.print("typeof str: {}\n", .{@TypeOf(str)});

    cString();
    coercion();
    sentinelTerminatedSlice();
}

fn cString() void {
    // `[*:0]u8` と `[*:0]const u8` は完全にCの文字列を表現出来る
    const c_string: [*:0]const u8 = "hello";
    var array: [5]u8 = undefined;

    var i: usize = 0;
    while (c_string[i] != 0) : (i += 1) {
        array[i] = c_string[i];
    }
}

fn coercion() void {
    // センチネル終了の値はそうではない値にcoerce出来る
    const a: [*:0]u8 = undefined;
    const b: [*]u8 = a;
    _ = b;

    const c: [5:0]u8 = undefined;
    const d: [5]u8 = c;
    _ = d;

    const e: [:0]f32 = undefined;
    const f: []f32 = e;
    _ = f;
}

fn sentinelTerminatedSlice() void {
    var x = [_:0]u8{255} ** 3;
    // センチネル終了スライスを作成する構文
    // x[n..m:t], tは終了値
    // これはメモリがあるべき場所で終了しているというアサーションであり、そうでなかった場合にはエラーになる
    const y = x[0..3 :0];
    debug.print("{any}\n", .{y});
}
