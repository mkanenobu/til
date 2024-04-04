const std = @import("std");
const debug = std.debug;

pub fn run() void {
    // inline でループをインライン化出来る
    // ただしインライン化した方が明確に速くなる場合を除いて、パフォーマンスのためにインライン化するのは推奨されない（コンパイラの方が賢い）
    const types = [_]type{ i32, f32, u8, bool };
    var sum: usize = 0;
    // ここではforだがwhileでも同じようにインライン化できる
    inline for (types) |T| sum += @sizeOf(T);
    debug.print("Sum of sizes: {}\n", .{sum});
}
