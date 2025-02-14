const std = @import("std");
const time = std.time;
const print = std.debug.print;

pub fn main() !void {
    var timer = try time.Timer.start();

    for (0..5) |i| {
        print("lap {}: {d:.3}ms\n", .{ i + 1, @as(f64, @floatFromInt(timer.read())) / time.ns_per_ms });
        time.sleep(time.ns_per_s * 1);
    }
}

test {
    std.testing.refAllDecls(@This());
}
