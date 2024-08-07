const std = @import("std");
const expect = std.testing.expect;

pub fn run() void {
    createWriteSeekRead() catch |err| {
        std.debug.print("Error: {any}\n", .{err});
    };
    fileStat() catch |err| {
        std.debug.print("Error: {any}\n", .{err});
    };
    makeDir() catch |err| {
        std.debug.print("Error: {any}\n", .{err});
    };
}

fn createWriteSeekRead() !void {
    // カレントファイルにファイルを作成
    const file = try std.fs.cwd().createFile(
        "junk_file.txt",
        .{ .read = true },
    );
    defer {
        file.close();
        std.fs.cwd().deleteFile("junk_file.txt") catch unreachable;
    }

    // 書き込み
    const bytes_written = try file.writeAll("Hello File!");
    _ = bytes_written;

    // 中身の読み込み
    var buffer: [100]u8 = undefined;
    try file.seekTo(0);
    const bytes_read = try file.readAll(&buffer);

    std.debug.print("bytes_read: {s}\n", .{buffer[0..bytes_read]});
}

fn fileStat() !void {
    // file.stat でファイルの情報を取得
    const file = try std.fs.cwd().createFile(
        "junk_file2.txt",
        .{ .read = true },
    );
    defer {
        file.close();
        std.fs.cwd().deleteFile("junk_file2.txt") catch unreachable;
    }

    const stat = try file.stat();
    std.debug.print("stat: {any}\n", .{stat});
    std.debug.print("size: {}\n", .{stat.size});
    std.debug.print("kind: {}\n", .{stat.kind});
    std.debug.print("ctime: {}\n", .{stat.ctime});
    std.debug.print("mtime: {}\n", .{stat.mtime});
    std.debug.print("atime: {}\n", .{stat.atime});
}

fn makeDir() !void {
    // ディレクトリを作成し、iterableを使って中にファイルを作成
    try std.fs.cwd().makeDir("test-tmp");
    var dir = try std.fs.cwd().openDir(
        "test-tmp",
        .{},
    );
    defer {
        dir.close();
        std.fs.cwd().deleteTree("test-tmp") catch unreachable;
    }

    _ = try dir.createFile("x", .{});
    _ = try dir.createFile("y", .{});
    _ = try dir.createFile("z", .{});

    var file_count: usize = 0;
    var iter = dir.iterate();
    while (try iter.next()) |entry| {
        if (entry.kind == .file) file_count += 1;
    }
    std.debug.print("file_count: {}\n", .{file_count});
}
