const debug = @import("std").debug;

pub fn main() void {
    var i: u8 = 2;
    while (i < 10) {
        debug.print("i: {}\n", .{i});
        i += 1;
    }
    debug.print("i = {}\n", .{i});

    // with continue expression
    var sum: u8 = 0;
    var j: u8 = 2;
    while (j <= 10) : (j += 1) {
        sum += j;
    }
    debug.print("sum = {}\n", .{sum});

    // with continue and break
    var k: u8 = 2;
    while (k < 10) {
        if (k == 3) {
            k += 1;
            continue;
        }
        if (k == 5) {
            break;
        }
        debug.print("k: {}\n", .{k});
        k += 1;
    }
    debug.print("k = {}\n", .{k});
}
