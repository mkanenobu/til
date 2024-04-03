const std = @import("std");

pub fn main() !void {
    var client: std.http.Client = .{ .allocator = std.heap.page_allocator };
    defer client.deinit();

    const uri = try std.Uri.parse("https://www.jma.go.jp/bosai/forecast/data/forecast/130000.json");

    var req = try client.request(.GET, uri, .{ .allocator = std.heap.page_allocator }, .{});
    defer req.deinit();

    try req.start();
    try req.wait();

    var resBody = std.ArrayList(u8).init(std.heap.page_allocator);
    const responseReader = req.reader();
    try responseReader.readAllArrayList(&resBody, 1024 * 1024 * 1024);

    const stdout = std.io.getStdOut();
    var bw = std.io.bufferedWriter(stdout);

    try stdout.writeAll(resBody.items);
    try bw.flush();
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
