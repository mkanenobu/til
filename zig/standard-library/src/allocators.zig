const std = @import("std");
const expect = std.testing.expect;

pub fn run() void {
    // 標準ライブラリはメモリアロケーションを行う方法を提供する
    // 標準ライブラリで暗黙的にメモリアロケーションが行われることはなく、プログラマはメモリアロケーションの方法を正確に選択出来る

    heapPageAllocator() catch |err| {
        std.debug.print("Error: {}\n\n", .{err});
    };
    heapFixedBufferAllocator() catch |err| {
        std.debug.print("Error: {}\n\n", .{err});
    };
    heapArenaAllocator() catch |err| {
        std.debug.print("Error: {}\n\n", .{err});
    };
    generalPurposeAllocator() catch |err| {
        std.debug.print("Error: {}\n\n", .{err});
    };

    // 高いパフォーマンスを求める場合、std.heap.c_allocator を使う手段もある（安全性に乏しい）
    // それを使う場合は libc とリンクする必要があり、コンパイラの `-lc` オプションを使う
}

fn heapPageAllocator() !void {
    // std.heap.page_allocatorは最も標準的なアロケータ
    // このアロケータがメモリ割り当てを行うたびに、OSにメモリのページ全体を要求する
    // OSにメモリを要求するにはシステムコールが必要なので、速度の面で非常に非効率
    const allocator = std.heap.page_allocator;

    // メモリ確保
    const memory = try allocator.alloc(u8, 100);
    // deferでブロックを抜けるときに解放
    defer allocator.free(memory);

    std.debug.print("std.heap.page_allocator\n", .{});
    std.debug.print("memory size: {}\n", .{memory.len});
    std.debug.print("typeof memory: {}\n\n", .{@TypeOf(memory)});

    // alloc, free はスライス用に利用される
    // 単一の要素を確保する場合は、create と destroy を使うことも検討出来る
    const byte = try std.heap.page_allocator.create(u8);
    defer std.heap.page_allocator.destroy(byte);
    byte.* = 128;
}

fn heapFixedBufferAllocator() !void {
    // std.heap.FixedBufferAllocator は固定サイズのバッファを使うアロケータでヒープ割り当てを利用しない
    // カーネルを書くときなど、ヒープの使用を避けたい場合に使う
    // またパフォーマンス観点でも検討の余地がある
    // バッファが足りなくなると OutOfMemory エラーが発生する
    var buffer: [1024]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(buffer[0..]);
    const allocator = fba.allocator();

    const memory = try allocator.alloc(u8, 100);
    defer allocator.free(memory);

    std.debug.print("std.heap.FixedBufferAllocator\n", .{});
    std.debug.print("memory size: {}\n", .{memory.len});
    std.debug.print("typeof memory: {}\n\n", .{@TypeOf(memory)});

    // バッファのサイズが1024でmemoryで100バイト確保したので、残りは924バイト
    // 925バイト以上を確保しようとするとエラーになる
    const memory2 = try allocator.alloc(u8, 1024 - 100 + 1);
    defer allocator.free(memory2);
}

fn heapArenaAllocator() !void {
    // std.heap.ArenaAllocator は子アロケータを取り込む
    // 何度でもアロケート出来るが、解放されるのは一度だけ

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    // .deinit() で全てのアロケーションを解放
    defer arena.deinit();
    // この例で allocator.free() を呼び出しても何も起きない
    const allocator = arena.allocator();

    std.debug.print("std.heap.ArenaAllocator\n\n", .{});
    _ = try allocator.alloc(u8, 1);
    _ = try allocator.alloc(u8, 10);
    _ = try allocator.alloc(u8, 100);
}

fn generalPurposeAllocator() !void {
    // zigには汎用アロケータもある
    // これは二重解放や開放後の参照を防止し、リークを検出出来る安全なアロケータ
    // 安全性のチェックとスレッドセーフティはオプションに渡す構造体で無効化出来る（例では空のまま=デフォルト設定）
    // GPAはパフォーマンスより安全性を重視して設計されているが、それでも page_allocator よりも高速
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    std.debug.print("std.heap.GeneralPurposeAllocator\n\n", .{});

    defer {
        const status = gpa.deinit();
        if (status == .leak) std.log.err("Leaked!", .{});
    }

    const bytes = try allocator.alloc(u8, 100);
    defer allocator.free(bytes);
}

test "test allocator" {
    // std.testing.allocator はテストでのみ利用出来る、メモリリークを検出可能な特殊なアロケータ
    const allocator = std.testing.allocator;
    const memory = try allocator.alloc(u8, 100);
    defer allocator.free(memory);
}
