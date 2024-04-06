const std = @import("std");

pub fn run() void {
    // std.fmt はデータを文字列に変換するための手段を提供する
    // フォーマット文字列はコンパイル時点で確定している必要がある

    format() catch unreachable;
    print() catch unreachable;
    helloWorld() catch unreachable;
    anySpecifier() catch unreachable;
    customFormat() catch unreachable;
}

fn format() !void {
    // {d} は10進数を表す
    var allocator = std.heap.page_allocator;
    const string = try std.fmt.allocPrint(allocator, "{d} + {d} = {d}", .{ 9, 10, 19 });
    defer allocator.free(string);
    try std.testing.expect(std.mem.eql(u8, string, "9 + 10 = 19"));
}

fn print() !void {
    var list = std.ArrayList(u8).init(std.heap.page_allocator);
    defer list.deinit();

    // writer には print メソッドが実装されている
    try list.writer().print(
        "{} + {} = {}",
        .{ 9, 10, 19 },
    );
    try std.testing.expect(std.mem.eql(u8, list.items, "9 + 10 = 19"));
}

fn helloWorld() !void {
    // stdout への出力、{s} は文字列を表す
    // std.debug.print は stderr に出力することと、mutex で保護されている以外はこれとほぼ同じ
    const out = std.io.getStdOut();
    try out.writer().print("Hello, {s}\n", .{"World"});
}

fn anySpecifier() !void {
    // {any} はデフォルトのフォーマットが利用される
    std.debug.print("{any}\n", .{"Hello, World!"});
    std.debug.print(
        "{any} + {any} = {any}\n",
        .{
            @as([]const u8, &[_]u8{ 1, 4 }),
            @as([]const u8, &[_]u8{ 2, 5 }),
            @as([]const u8, &[_]u8{ 3, 9 }),
        },
    );
}

// カスタムフォーマットを持つ型を定義してみる
const Person = struct {
    name: []const u8,
    birth_year: i32,
    death_year: ?i32,

    pub fn format(
        self: Person,
        comptime fmt: []const u8,
        options: std.fmt.FormatOptions,
        writer: anytype,
    ) !void {
        _ = fmt;
        _ = options;

        try writer.print("{s} ({}-", .{
            self.name, self.birth_year,
        });

        if (self.death_year) |year| {
            try writer.print("{}", .{year});
        }

        try writer.writeAll(")");
    }
};

fn customFormat() !void {
    const john = Person{ .name = "John Carmack", .birth_year = 1970, .death_year = null };
    std.debug.print("{s}\n", .{john});

    const claude = Person{
        .name = "Claude Shannon",
        .birth_year = 1916,
        .death_year = 2001,
    };
    std.debug.print("{s}\n", .{claude});
}
