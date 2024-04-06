const std = @import("std");

pub fn run() void {
    // std.io.Reader と std.io.Writer はIOを利用するための標準的なインターフェースを提供する
    ioWriter() catch unreachable;
    ioReader() catch unreachable;

    // readUntilNextLine() catch unreachable;

    customWriter() catch unreachable;
}

fn ioWriter() !void {
    // ArrayList は Writer を提供するメソッドを持つ
    var list = std.ArrayList(u8).init(std.heap.page_allocator);
    defer list.deinit();
    const bytes_written = try list.writer().write(
        "Hello World!",
    );
    std.debug.print("bytes_written: {}\n", .{bytes_written});
    std.debug.print("content: {s}\n", .{list.items});
}

fn ioReader() !void {
    const message = "Hello File!";

    // ファイルを作って適当な内容を書き込み
    const file = try std.fs.cwd().createFile(
        "junk_file2.txt",
        .{ .read = true },
    );
    defer {
        file.close();
        std.fs.cwd().deleteFile("junk_file2.txt") catch unreachable;
    }
    try file.writeAll(message);
    try file.seekTo(0);

    var allocator = std.heap.page_allocator;
    // Reader を使ってファイルを読み込む
    const contents = try file.reader().readAllAlloc(
        allocator,
        message.len,
    );
    defer allocator.free(contents);

    try std.testing.expect(std.mem.eql(u8, contents, message));
}

fn nextLine(reader: anytype, buffer: []u8) !?[]const u8 {
    var line = (try reader.readUntilDelimiterOrEof(
        buffer,
        '\n',
    )) orelse return null;
    // trim annoying windows-only carriage return character
    if (@import("builtin").os.tag == .windows) {
        return std.mem.trimRight(u8, line, "\r");
    } else {
        return line;
    }
}

fn readUntilNextLine() !void {
    const stdout = std.io.getStdOut();
    const stdin = std.io.getStdIn();

    try stdout.writeAll(
        \\ Enter your name:
    );

    var buffer: [100]u8 = undefined;
    const input = (try nextLine(stdin.reader(), &buffer)).?;
    try stdout.writer().print(
        "Your name is: \"{s}\"\n",
        .{input},
    );
}

// std.io.Writer は context type, error set, write function で構成される
// write function は context type と byte slice を取り込む必要がある
// また write function は Writer 型のエラーセットと書き込んだバイト数のunionを返す必要がある
// サンプルとして Writer を実装する型を定義する（実際にはこのようなケースでは ArrayList と FixedBufferAllocator を使う方が良い）
const MyByteList = struct {
    data: [100]u8 = undefined,
    items: []u8 = &[_]u8{},

    const Writer = std.io.Writer(
        *MyByteList,
        error{EndOfBuffer},
        appendWrite,
    );

    fn appendWrite(
        self: *MyByteList,
        data: []const u8,
    ) error{EndOfBuffer}!usize {
        if (self.items.len + data.len > self.data.len) {
            return error.EndOfBuffer;
        }
        std.mem.copy(
            u8,
            self.data[self.items.len..],
            data,
        );
        self.items = self.data[0 .. self.items.len + data.len];
        return data.len;
    }

    fn writer(self: *MyByteList) Writer {
        return .{ .context = self };
    }
};

fn customWriter() !void {
    var bytes = MyByteList{};
    _ = try bytes.writer().write("Hello");
    _ = try bytes.writer().write(" Writer!");
    try std.testing.expect(std.mem.eql(u8, bytes.items, "Hello Writer!"));
}
