const std = @import("std");

pub fn main() !void {
    // GeneralPurposeAllocator
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer if (gpa.deinit() == .leak) {
        std.debug.panic("leaks detected", .{});
    };
    const allocator = gpa.allocator();

    const n = try takeAllocator(allocator, "takeAllocator");
    std.debug.print("n = {d}\n", .{n});
    try wrapWithThreadSafeAllocator(allocator);
    try fixedBufferAllocatorExample();
    try arenaAllocatorExample();
}

// アロケータ選択のフローチャート
//
// 1. ライブラリを作成している場合は、ライブラリのユーザーが任意のアロケータを選択出来るようにするのがよい
// 2. libcをリンクしている場合は、少なくともメインのアロケータについては `std.heap.c_allocator` を使うのがよい可能性がある
// 3. 複数のスレッドで同じアロケータを使う必要がある場合には、 `std.heap.ThreadSafeAllocator` でラップしたアロケータを使うのがよい
// 4. 必要になる最大バイト長がコンパイル時に分かっている場合には、 `std.heap.FixedBufferAllocator` を使うのがよい
// 5. ゲームのmainループやWebサーバーのリクエストハンドラのような循環的な処理がなく、最後にまとめてメモリを解放すればいい場合には、
//   `std.heap.ArenaAllocator` を使うのがよい
// 6. ゲームのmainループやWebサーバーの循環的な処理"の一部"で、特定のタイミングでまとめて解放出来る場合にも `std.heap.ArenaAllocator` を使うのがよい
//   `std.heap.FixedBufferAllocator` を利用してさらに最適化することも出来る
// 7. テストを書いていて `error.OutOfMemory` が発生した場合の挙動を確認したい場合には `std.testing.FailingAllocator` を使うのがよい
// 8. テストには `std.testing.allocator` を使うのがよい
// 9. 上記のいずれにも当てはまらない場合には `std.heap.GeneralPurposeAllocator` を使うのがよい
//   GeneralPurposeAllocator は通常、main関数で1つだけ設定し、そのアロケータ・もしくはサブアロケータをアプリケーション全体で使う
// 10. アロケータを実行することも出来る
//   ref: https://ziglang.org/documentation/master/#Implementing-an-Allocator

fn takeAllocator(allocator: std.mem.Allocator, str: []const u8) !usize {
    var ar = std.ArrayList(u8).init(allocator);
    defer ar.deinit();

    for (str) |c| {
        try ar.append(c);
    }
    std.debug.print("{s}\n", .{ar.items});

    return ar.items.len;
}

fn wrapWithThreadSafeAllocator(allocator: std.mem.Allocator) !void {
    var tsAllocator = std.heap.ThreadSafeAllocator{ .child_allocator = allocator };
    const threadSafeAllocator = tsAllocator.allocator();

    _ = try takeAllocator(threadSafeAllocator, "wrapWithThreadSafeAllocator");
}

fn fixedBufferAllocatorExample() !void {
    var buffer: [1024]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    const allocator = fba.allocator();

    _ = try takeAllocator(allocator, "fixedBufferAllocatorExample");
}

fn arenaAllocatorExample() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    _ = try takeAllocator(allocator, "arenaAllocatorExample");
}

test {
    var fa = std.testing.FailingAllocator.init(std.testing.allocator, .{
        .fail_index = 0,
    });
    const allocator = fa.allocator();
    try std.testing.expectError(error.OutOfMemory, takeAllocator(allocator, "FailingAllocator"));
    try std.testing.expectEqual(17, try takeAllocator(std.testing.allocator, "testing.allocator"));
}
