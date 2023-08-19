const io = @import("std").io;

pub fn main() !void {
    const stdout_file = io.getStdOut().writer();
    var bw = io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("Hello, {s}\n", .{"World"});

    try bw.flush();
}
