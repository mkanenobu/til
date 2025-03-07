const debug = @import("std").debug;
const expect = @import("std").testing.expect;

const Point = struct { x: i32, y: i32 };

pub fn main() void {
    // anonymous structを使うとstructリテラルの宣言からstructの型を省略できる
    const pt: Point = .{
        .x = 13,
        .y = 67,
    };
    debug.print("point: x: {}, y: {}\n", .{ pt.x, pt.y });

    // Pointのフィールドを満たしているので、Point型としてcoerceされる
    debug.print("area: {}\n", .{area(.{ .x = 5, .y = 33 })});

    fullyAnonymous();
    tuple();
}

fn area(point: Point) i32 {
    return point.x * point.y;
}

fn fullyAnonymous() void {
    // anonymous structは他の型にcoerceされることなく完全にanonymousなまま利用出来る
    const anon = .{
        .int = @as(u32, 1234),
        .float = @as(f64, 12.34),
        .b = true,
        .s = "hi",
    };
    dump(anon) catch {};
    debug.print("typeof anon: {}\n", .{@TypeOf(anon)});
}

fn dump(args: anytype) !void {
    try expect(args.int == 1234);
    try expect(args.float == 12.34);
    try expect(args.b);
    try expect(args.s[0] == 'h');
    try expect(args.s[1] == 'i');
}

fn tuple() void {
    // フィールド名の無いanonymous structをtupleと呼ばれる
    // tupleは配列が持つプロパティの多くを持っており、ループが可能で、インデックスが使え、`++`, `**` 演算子が使え、
    // lenフィールドを持っている
    const values = .{
        @as(u32, 1234),
        @as(f64, 12.34),
        true,
        "hi",
    } ++ .{false} ** 2;
    debug.print("first element: {}\n", .{values[0]});
    debug.print("fifth element: {}\n", .{values[4]});

    inline for (values, 0..) |v, i| {
        if (i != 2) continue;
        expect(v) catch unreachable;
    }
    debug.print("values len: {}\n", .{values.len});

    // tupleは内部的には "0" から始まるフィールド名を持っており、 @"0" のような構文でアクセスできる
    debug.print("fourth element's first char: {c}\n", .{values.@"3"[0]});
}
