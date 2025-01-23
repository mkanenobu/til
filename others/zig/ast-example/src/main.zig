const std = @import("std");
const Ast = std.zig.Ast;
const print = std.debug.print;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer if (gpa.deinit() == .leak) {
        std.debug.panic("leaks detected", .{});
    };
    const allocator = gpa.allocator();

    const source = @embedFile("./main.zig");
    var ast = try Ast.parse(allocator, source[0..], .zig);
    defer ast.deinit(allocator);

    const firstNode = ast.nodes.get(0);
    print("firstNode tag: {any}\n", .{firstNode.tag});
    const lastNode = ast.nodes.get(ast.nodes.len - 1);
    print("lastNode tag: {any}\n", .{lastNode.tag});

    // tokens
    for (0..ast.tokens.len) |i| {
        const token = ast.tokens.get(i);
        print("token from {d}: {any}\n", .{ token.start, token.tag });
    }

    // render AST as Code
    var buf = std.ArrayList(u8).init(allocator);
    defer buf.deinit();
    try ast.renderToArrayList(&buf, .{});
    print("rendered: {s}\n", .{buf.items});
}

test {
    std.testing.refAllDecls(@This());
}
