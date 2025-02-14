const std = @import("std");

const stdio = @cImport({
    @cInclude("stdio.h");
});

extern fn add(a: c_int, b: c_int) c_int;

pub fn main() !void {
    _ = stdio.puts("Hello, world!");

    {
        const myCCode = @cImport({
            @cInclude("c_code.h");
        });

        std.debug.print("via imported struct: {d}\n", .{myCCode.add(1, 2)});
    }

    // externの方はコンパイル時に読み込まれていれば動く（@cImportとは別経路）
    std.debug.print("via extern: {d}\n", .{add(3, 4)});
}

test {
    std.testing.refAllDeclsRecursive(@This());
}
