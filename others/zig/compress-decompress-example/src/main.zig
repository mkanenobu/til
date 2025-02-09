const std = @import("std");
const fs = std.fs;
const compress = std.compress;
const gzip = compress.gzip;

pub fn main() !void {
    var f = try fs.cwd().openFile("src/main.zig", .{});
    defer f.close();
    const f_reader = f.reader();
    const original_contents = try f_reader.readAllAlloc(std.heap.page_allocator, 4096);
    try f.seekTo(0);

    var zipped_buf: [4096]u8 = undefined;
    var zip_stream = std.io.fixedBufferStream(&zipped_buf);
    const zip_writer = zip_stream.writer();

    try gzip.compress(f_reader, zip_writer, .{});

    const zipped_size = zip_stream.getWritten().len;
    try zip_stream.seekTo(0);
    const zip_reader = zip_stream.reader();

    var unzipped_buf: [4096]u8 = undefined;
    var unzip_stream = std.io.fixedBufferStream(&unzipped_buf);
    const unzip_writer = unzip_stream.writer();

    try gzip.decompress(zip_reader, unzip_writer);

    const unzipped_contents = unzip_stream.getWritten();

    std.debug.print(
        "original contents size: {}, zipped: {}, unzipped: {}\n",
        .{original_contents.len, zipped_size, unzipped_contents.len}
    );
    std.debug.print("unuzipped contents equals original: {}\n", .{std.mem.eql(u8, original_contents, unzipped_contents)});
}

test {
    std.testing.refAllDeclsRecursive(@This());
}
