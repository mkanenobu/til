const debug = @import("std").debug;

pub fn run() void {
    // スライスはデータへのポインター [*]T と usize （要素数）のペアと考えることができる
    const arr = [_]u8{ 1, 2, 3, 4, 5 };
    // [n..m] は x[n] から x[m - 1] までの範囲
    const slice = arr[0..3];
    debug.print("sum: {}\n", .{total(slice)});

    debug.print("slice type is {any}\n", .{@TypeOf(slice)}); // *const [3]u8

    // 最後までのスライス
    var allSlice = arr[0..];
    debug.print("{any}, sum: {}\n", .{ allSlice, total(allSlice) });

    // スライスのスライス
    const sliceSlice = allSlice[1..];
    debug.print("second to last sum: {}\n", .{total(sliceSlice)});
}

fn total(values: []const u8) usize {
    var sum: usize = 0;
    for (values) |v| sum += v;
    return sum;
}
