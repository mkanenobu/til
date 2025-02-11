const std = @import("std");
const print = std.debug.print;
const MultiArrayList = std.MultiArrayList;

const Entry = struct {
    id: u64,
    name: []const u8,

    pub fn format(
        self: Entry,
        comptime fmt: []const u8,
        options: std.fmt.FormatOptions,
        writer: anytype,
    ) !void {
        _ = fmt;
        _ = options;

        try writer.print("id: {} name: {s}", .{ self.id, self.name });
    }
};

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer {
        if (gpa.deinit() == .leak) {
            std.debug.print("gpa leaked\n", .{});
        }
    }

    var mal = MultiArrayList(Entry){};
    defer mal.deinit(allocator);

    print("len: {}, cap: {}, items: {any}\n", .{ mal.len, mal.capacity, mal.items(.id) });

    try mal.append(allocator, .{
        .id = 1,
        .name = "John",
    });

    print("len: {}, cap: {}, items: {any}\n", .{ mal.len, mal.capacity, mal.items(.id) });

    try mal.append(allocator, .{
        .id = 2,
        .name = "John",
    });

    print("len: {}, cap: {}, items: {any}\n", .{ mal.len, mal.capacity, mal.items(.id) });

    print("{any}\n", .{mal.get(1)});
}

test {
    std.testing.refAllDeclsRecursive(@This());
}
