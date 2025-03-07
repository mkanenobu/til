const debug = @import("std").debug;

pub fn main() void {
    var x: i16 = 5;
    {
        // deferは現在のブロックが終了するときにステートメントを実行するために使う
        defer x += 2;
        // この時点では x += 2 は実行されていないので5になる
        debug.print("x: {}\n", .{x});
    }
    // x += 2 が実行されているので7になる
    debug.print("x: {}\n", .{x});

    // multi defer
    var y: f32 = 5;
    {
        // ブロック内に複数のdeferがある場合には定義と逆順に実行される
        // 下の例では定義順に実行された場合、yは3.5になるが、逆順に実行されるためyは4.5になる
        defer y += 2;
        defer y /= 2;
    }
    debug.print("y: {}\n", .{y});
}
