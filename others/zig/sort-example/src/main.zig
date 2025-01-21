const std = @import("std");
const sort = std.sort;

pub fn main() !void {
    var numbers = [_]u8{1, 4, 3, 2, 6, 5};
    std.debug.print("{any}\n", .{numbers});
    sort.pdq(u8, &numbers, {}, sort.asc(u8));
    std.debug.print("{any}\n", .{numbers});
}

test {
    std.testing.refAllDecls(@This());
}
