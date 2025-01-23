const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    const v = .{"Hello"};
    const t = @TypeOf(v);
    print("{any}\n", .{t});

    const MyTuple = std.meta.Tuple(&.{[]const u8, u8, u8});
    const v2: MyTuple = .{"Hello, World!", 1, 2};
    const t2 = @TypeOf(v2);
    print("{any}\n", .{t2});
}

test {
    std.testing.refAllDecls(@This());
}
