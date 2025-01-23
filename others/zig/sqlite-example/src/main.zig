const std = @import("std");
const sqlite = @import("sqlite");
const fs = std.fs;
const print = std.debug.print;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer if (gpa.deinit() == .leak) {
        std.debug.panic("leaks detected", .{});
    };
    const allocator = gpa.allocator();

    fs.cwd().deleteFile("./example.db") catch {};

    var db = try sqlite.Db.init(.{
        .mode = sqlite.Db.Mode{
            .File = "./example.db",
        },
        .open_flags = .{
            .write = true,
            .create = true,
        },
    });
    defer db.deinit();

    const createTableQuery =
        \\CREATE TABLE users (
        \\  id INTEGER PRIMARY KEY AUTOINCREMENT,
        \\  name TEXT NOT NULL,
        \\  age INTEGER
        \\)
    ;
    try db.exec(createTableQuery, .{}, .{});
    print("Table created\n", .{});

    try User.insertUser(&db, .{ .name = "Alice", .age = 30 });
    try User.insertUser(&db, .{ .name = "Bob", .age = 22 });
    print("Data inserted\n", .{});

    const user = try User.getUserById(allocator, &db, 1);
    defer if (user) |u| {
        allocator.free(u.name);
    };
    print("User: {any}\n", .{user});
}

const User = struct {
    id: usize,
    name: []const u8,
    age: ?u8,

    pub fn insertUser(db: *sqlite.Db, user: struct { name: []const u8, age: ?u8 }) !void {
        const query =
            \\INSERT INTO users (name, age)
            \\VALUES (?, ?)
    ;
        try db.exec(query, .{}, .{ user.name, user.age });
    }

    pub fn getUserById(allocator: std.mem.Allocator, db: *sqlite.Db, id: usize) !?User {
        return try db.oneAlloc(
            User,
            allocator,
            "SELECT id, name, age FROM users WHERE id = ?",
            .{},
            .{id},
        );
    }
};

test {
    std.testing.refAllDecls(@This());
}
