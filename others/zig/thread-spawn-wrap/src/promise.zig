const std = @import("std");
const Thread = std.Thread;

pub fn Promise(comptime T: type) type {
    return struct {
        thread: Thread,
        threadlocal var result: ?T = null
        err: ?anyerror = null,

        pub fn run(allocator: std.mem.Allocator, f: anytype, args: anytype) !Promise(T) {
            const promise = Promise(T){
                .thread = try Thread.spawn(.{ .allocator = allocator }, f, args),
            };
            return promise;
        }

        pub fn wait(self: *Promise(T)) void {
            self.thread.join();
            
            var y = self.thread.yield() catch unreachable;
        }
    };
}
