const std = @import("std");
const http = std.http;

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    var client = http.Client{
        .allocator = allocator,
    };
    defer client.deinit();

    const url = "https://www.jma.go.jp/bosai/forecast/data/forecast/130000.json";

    var res_buffer = std.ArrayList(u8).init(allocator);
    defer res_buffer.deinit();

    const result = try client.fetch(.{
        .method = .GET,
        .location = .{
            .url = url,
        },
        .response_storage = .{
            .dynamic = &res_buffer,
        },
    });

    std.debug.print("status: {}\n", .{result.status});
    std.debug.print("status is ok: {}\n", .{result.status == .ok});
    std.debug.print("response body: {s}\n", .{res_buffer.items});
}
