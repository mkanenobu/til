const std = @import("std");

pub fn run() void {
    seedRandom() catch unreachable;
}

fn seedRandom() !void {
    // OSのランダム値のシードを利用して擬似乱数生成器を初期化する例
    // DefaultPrng = Xoroshiro128
    // 他にも標準ライブラリの中にはいくつかの実装がある
    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.posix.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });
    const rand = prng.random();

    const a = rand.float(f32);
    const b = rand.boolean();
    const c = rand.int(u8);
    const d = rand.intRangeAtMost(u8, 0, 255);

    std.debug.print("{}\n", .{.{ a, b, c, d }});
}
