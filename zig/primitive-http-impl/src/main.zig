const std = @import("std");
const http = std.http;
const log = std.log;
const print = std.debug.print;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer {
        if (gpa.deinit() == .leak) {
            std.debug.print("gpa leaked\n", .{});
        }
    }

    const host = "example.com";
    const port = 80;
    const path = "/";
    const method = "GET";
    const http_version = "HTTP/1.1";

    const conn = try std.net.tcpConnectToHost(allocator, host, port);
    defer conn.close();

    const writer = conn.writer();
    var w = std.io.bufferedWriter(writer);

    const request = try std.fmt.allocPrint(allocator, "{s} {s} {s}\r\n", .{method, path, http_version});
    defer allocator.free(request);
    const request_host = try std.fmt.allocPrint(allocator, "Host: {s}\r\n", .{host});
    defer allocator.free(request_host);

    _ = try w.write(request);
    _ = try w.write(request_host);
    _ = try w.write("Connection: close\r\n");
    _ = try w.write("Accept: */*\r\n");
    _ = try w.write("\r\n");
    try w.flush();

    log.info("Request sent, waiting for response", .{});

    var buf: [4096]u8 = undefined;
    const bytes_read = try conn.readAll(&buf);
    log.info("Response: \n{s}", .{buf[0..bytes_read]});
}

fn httpRequest(url: []const u8) !void {
    const host = "example.com";
    const port = 80;
    const path = "/";
    const method = "GET";
    const http_version = "HTTP/1.1";

    const conn = try std.net.tcpConnectToHost(std.heap.page_allocator, host, port);
    defer conn.close();

    const writer = conn.writer();
    var w = std.io.bufferedWriter(writer);

    const request = try std.fmt.allocPrint(std.heap.page_allocator, "{s} {s} {s}\r\n", .{method, path, http_version});
    defer std.heap.page_allocator.free(request);
    const request_host = try std.fmt.allocPrint(std.heap.page_allocator, "Host: {s}\r\n", .{host});
    defer std.heap.page_allocator.free(request_host);

    _ = try w.write(request);
    _ = try w.write(request_host);
    _ = try w.write("Connection: close\r\n");
    _ = try w.write("Accept: */*\r\n");
    _ = try w.write("\r\n");
    try w.flush();

    log.info("Request sent, waiting for response", .{});

    var buf: [4096]u8 = undefined;
    const bytes_read = try conn.readAll(&buf);
    log.info("Response: \n{s}", .{buf[0..bytes_read]});
}

test {
    std.testing.refAllDeclsRecursive(@This());
}
