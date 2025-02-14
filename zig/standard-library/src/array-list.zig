const std = @import("std");
const ArrayList = std.ArrayList;
const expect = std.testing.expect;

pub fn run() !void {
    // ArrayList(T) はC++の std::vector<T> やRustの Vec<T> に相当する、サイズが可変なバッファ
    var list = ArrayList(u8).init(std.heap.page_allocator);
    // deinit は ArrayList の全てのメモリを解放する
    defer list.deinit();

    try list.append('H');
    try list.append('e');
    try list.append('l');
    try list.append('l');
    try list.append('o');
    try list.appendSlice(" World!");

    // メモリは items フィールドを介して読み書き出来る
    try expect(std.mem.eql(u8, list.items, "Hello World!"));
    std.debug.print("{s}\n", .{list.items});
}
