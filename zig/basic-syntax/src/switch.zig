const debug = @import("std").debug;

pub fn run() void {
    var x: i8 = 10;
    // switch文、網羅性チェックあり
    switch (x) {
        -1...1 => {
            x = -x;
        },
        10, 100 => {
            x = @divExact(x, 10);
        },
        else => {},
    }
    debug.print("x = {}\n", .{x});

    var y: i8 = 10;
    // 式としても使える
    y = switch (y) {
        -1...1 => -y,
        10, 100 => @divExact(y, 10),
        else => y,
    };
    debug.print("y = {}\n", .{y});
}
