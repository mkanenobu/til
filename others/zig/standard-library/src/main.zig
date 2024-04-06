const std = @import("std");
const allocators = @import("allocators.zig");
const arrayList = @import("array-list.zig");
const filesystem = @import("filesystem.zig");
const readersAndWriters = @import("readers-and-writers.zig");
const formatting = @import("formatting.zig");
const randomNumbers = @import("random-numbers.zig");
const hashMaps = @import("hash-maps.zig");
const stacks = @import("stacks.zig");

pub fn main() !void {
    allocators.run();
    arrayList.run() catch unreachable;
    filesystem.run();
    readersAndWriters.run();
    formatting.run();
    randomNumbers.run();
    hashMaps.run();
    stacks.run();
}
