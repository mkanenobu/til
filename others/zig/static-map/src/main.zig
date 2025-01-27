const std = @import("std");

pub fn main() !void {
    const kv  = [_]struct { []const u8, i8 }{
        .{ "key1", 11 },
        .{ "key2", 22 },
        .{ "key3", 33 },
    };
    const static_map = std.StaticStringMap(i8).initComptime(&kv);

    std.debug.print("{?}\n", .{static_map.get("key1")});
    std.debug.print("{?}\n", .{static_map.get("key2")});
    std.debug.print("{?}\n", .{static_map.get("key4")});
}

test {
    std.testing.refAllDecls(@This());
}
