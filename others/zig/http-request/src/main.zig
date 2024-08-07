const std = @import("std");

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    var client: std.http.Client = .{ .allocator = allocator };
    defer client.deinit();

    const url = "https://www.jma.go.jp/bosai/forecast/data/forecast/130000.json";

    var resBuffer = std.ArrayList(u8).init(allocator);
    defer resBuffer.deinit();

    const result = try client.fetch(.{ .method = .GET, .location = .{ .url = url }, .response_storage = .{ .dynamic = &resBuffer } });

    std.debug.print("status: {}\n", .{result.status});
    std.debug.print("status is ok: {}\n", .{result.status == .ok});
    std.debug.print("response body: {s}\n", .{resBuffer.items});
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
