const std = @import("std");
const json = std.json;
const lib = @import("formatting-example_lib");

pub fn main() !void {
    const myStruct = MyStruct{ .id = 1, .name = "John Doe", .email = "john@example.com" };
    std.debug.print("{}\n", .{myStruct});
    std.debug.print("{json}\n", .{myStruct});
}

const MyStruct = struct {
    id: u32,
    name: []const u8,
    email: ?[]const u8,

    pub fn format(
        self: MyStruct,
        comptime fmt: []const u8,
        options: std.fmt.FormatOptions,
        writer: anytype,
    ) !void {
        std.log.debug("fmt: {s}, options: {any}", .{ fmt, options });

        if (std.mem.eql(u8, fmt, "json")) {
            try json.stringify(self, .{}, writer);
        } else {
            try writer.print("{d}: {s}", .{ self.id, self.name });
            if (self.email) |email| {
                try writer.print(" <{s}>", .{email});
            }
        }
    }
};

test {
    std.testing.refAllDeclsRecursive(@This());
}
