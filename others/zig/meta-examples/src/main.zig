const std = @import("std");
const builtin = std.builtin;
const meta = std.meta;
const print = std.debug.print;

pub fn main() !void {
    try fieldsExample();
}

// fieldは型のフィールドの情報を値として返す
fn fieldsExample() !void {
    const v = .{ .x = 1, .y = 2 };
    // fieldsの型は不定だがcomptimeに一意に確定する（合っていないとコンパイルエラー）
    const fields: []const builtin.Type.StructField = comptime meta.fields(@TypeOf(v));
    print("fields len: {d}\n", .{fields.len});
    print("fields[0].name: {s}\n", .{fields[0].name});
    print("fields[1].name: {s}\n", .{fields[1].name});
}

// FieldEnumは型のフィールドの情報を型として返す
fn fieldEnumExample() !void {
    const v = .{ .x = 1, .y = 2 };
    const FieldEnum = meta.FieldEnum(@TypeOf(v));
    for (fields) |field| {
        print("field.name: {s}\n", .{field.name});
    }
}

test {
    std.testing.refAllDecls(@This());
}
