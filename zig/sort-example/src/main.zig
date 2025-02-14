const std = @import("std");
const sort = std.sort;

pub fn main() !void {
    var numbers = [_]u8{ 1, 4, 3, 2, 6, 5 };
    std.debug.print("{any}\n", .{numbers});
    // pdq = pattern-defining quicksort
    sort.pdq(u8, &numbers, {}, sort.asc(u8));
    std.debug.print("{any}\n", .{numbers});

    // other sorting algorithms available
    sort.block(u8, &numbers, {}, sort.desc(u8));
    std.debug.print("{any}\n", .{numbers});

    try sortStruct();
}

fn sortStruct() !void {
    const MyStruct = struct {
        a: u8,
        b: u8,

        const Self = @This();

        // custom comparators
        pub fn compA(_: void, a: Self, b: Self) bool {
            return a.a < b.a;
        }

        pub fn compB(_: void, a: Self, b: Self) bool {
            return a.b < b.b;
        }
    };

    var arr = [_]MyStruct{
        .{ .a = 1, .b = 3 },
        .{ .a = 4, .b = 5 },
        .{ .a = 3, .b = 4 },
        .{ .a = 2, .b = 2 },
        .{ .a = 6, .b = 1 },
        .{ .a = 5, .b = 6 },
    };
    std.debug.print("{any}\n", .{arr});
    // sort by .a
    sort.heap(MyStruct, &arr, {}, MyStruct.compA);
    std.debug.print("{any}\n", .{arr});
    // sort by .b
    sort.heap(MyStruct, &arr, {}, MyStruct.compB);
    std.debug.print("{any}\n", .{arr});
}

test {
    std.testing.refAllDecls(@This());
}
