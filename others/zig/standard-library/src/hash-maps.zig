const std = @import("std");

pub fn run() void {
    autpHashMap() catch unreachable;
    fetchPut() catch unreachable;
    stringHashMap() catch unreachable;
}

fn autpHashMap() !void {
    // std.AutoHashMap でキーと値からなるハッシュマップを作成できる
    // 初期化にはキーと値の型の指定とアロケータが必要
    var map = std.AutoHashMap(u32, u32).init(std.heap.page_allocator);
    defer map.deinit();

    try map.put(1, 2);
    try map.put(3, 4);
    try map.put(5, 6);
    try map.put(7, 8);
    try std.testing.expect(map.count() == 4);

    std.debug.print("map[1]: {}\n", .{map.get(1).?});

    var sum: u32 = 0;
    var iter = map.iterator();
    while (iter.next()) |v| {
        std.debug.print("key: {}, value: {}\n", .{ v.key_ptr.*, v.value_ptr.* });
        sum += v.value_ptr.*;
    }
    std.debug.print("sum: {}\n", .{sum});
}

fn fetchPut() !void {
    var map = std.AutoHashMap(u32, []const u8).init(std.heap.page_allocator);
    defer map.deinit();

    try map.put(100, "foo");
    try map.put(101, "bar");

    // fetchPut はマップに値をセットして、既に同じキーがあった場合にはその値を返す
    const old = try map.fetchPut(100, "baz");
    std.debug.print("old key: {d}, old value: {s}\n", .{ old.?.key, old.?.value });
}

fn stringHashMap() !void {
    // std.StringHashMap は文字列をキーとするハッシュマップ
    // std.StringHashMap や std.AutoHashMap は std.HashMap のラッパーなので要件に合わない場合には std.HashMap を使う
    // 他にも std.ArrayHashMap などがある
    var map = std.StringHashMap(enum { x, y }).init(std.heap.page_allocator);
    defer map.deinit();

    try map.put("foo", .x);
    try map.put("bar", .y);

    try std.testing.expect(map.get("foo").? == .x);
    try std.testing.expect(map.get("bar").? == .y);
}
