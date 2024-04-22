const std = @import("std");
const Thread = std.Thread;

pub fn Promise(comptime T: type) type {
    return struct {
        thread: Thread,
        result: ?T = null,
        err: ?anyerror = null,

        pub fn init(allocator: std.Allocator, f: fn () anyerror!T) !Promise(T) {
            var promise = Promise(T){
                .thread = try Thread.spawn(allocator, f),
            };
            return promise;
        }

        pub fn then(self: *Promise(T), comptime U: type, onFulfilled: fn (T) anyerror!U, onRejected: fn (anyerror) anyerror!U) !Promise(U) {
            const S = struct {
                fn wrapper(promise: *Promise(T)) anyerror!U {
                    promise.thread.join();
                    if (promise.err) |err| {
                        return try onRejected(err);
                    } else {
                        return try onFulfilled(promise.result.?);
                    }
                }
            };
            return try Promise(U).init(self.thread.allocator, S.wrapper);
        }

        pub fn resolve(self: *Promise(T), value: T) void {
            self.result = value;
        }

        pub fn reject(self: *Promise(T), err: anyerror) void {
            self.err = err;
        }
    };
}
