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

    var request_buf: [1024]u8 = undefined;
    const request = try std.fmt.bufPrint(&request_buf, "{s} {s} {s}\r\n", .{method, path, http_version});

    var host_buf: [1024]u8 = undefined;
    const request_host = try std.fmt.bufPrint(&host_buf, "Host: {s}\r\n", .{host});

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
