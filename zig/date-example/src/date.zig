const std = @import("std");
const time = std.time;
const epoch = time.epoch;

pub const Year = epoch.Year;
pub const Month = u4;
pub const Day = u9;

pub const Date = struct {
    const Self = @This();

    epochDays: u47,

    // month and day are 1-indexed
    pub fn new(params: struct { year: Year, month: Month, day: Day }) Self {
        return Self{
            .epochDays = epochDays(.{ .year = params.year, .month = params.month, .day = params.day }),
        };
    }

    pub fn fromUnixMills(ms: u64) Self {
        return Self{
            .epochDays = @intCast(ms / time.ms_per_day),
        };
    }

    fn dayIndexOfYear(params: struct { year: Year, month: Month, day: Day }) Day {
        var idx: Day = params.day - 1;
        for (1..params.month) |m| {
            const m_: epoch.Month = @enumFromInt(m);
            const leapKind: epoch.YearLeapKind = if (epoch.isLeapYear(params.year)) .leap else .not_leap;
            const daysInMonth = epoch.getDaysInMonth(leapKind, m_);
            idx += daysInMonth;
        }
        return idx;
    }

    fn epochDays(params: struct { year: Year, month: Month, day: Day }) u47 {
        var idx: u47 = dayIndexOfYear(.{ .year = params.year, .month = params.month, .day = params.day });
        for (epoch.epoch_year..params.year) |y| {
            idx += epoch.getDaysInYear(@intCast(y));
        }
        return idx;
    }

    fn getYear(self: Self) Year {
        const ed = epoch.EpochDay{.day = self.epochDays };
        return ed.calculateYearDay().year;
    }

    fn getMonth(self: Self) Month {
        const ed = epoch.EpochDay{.day = self.epochDays };
        const md = ed.calculateYearDay().calculateMonthDay();
        return md.month.numeric();
    }

    fn getDay(self: Self) Day {
        const ed = epoch.EpochDay{.day = self.epochDays };
        const md = ed.calculateYearDay().calculateMonthDay();
        return md.day_index + 1;
    }

    fn getDayOfWeek(self: Self) DayOfWeek {
        return getDayOfWeekImpl(.{
            .year = self.getYear(),
            .month = self.getMonth(),
            .day = self.getDay(),
        });
    }
    fn getDayOfWeekImpl(params: struct { year: Year, month: Month, day: Day }) DayOfWeek {
        const day = params.day;
        var y: u32 = @intCast(params.year);
        var m: u8 = @intCast(params.month);
        if (m < 3) {
            m += 12;
            y -= 1;
        }

        const k = y % 100;
        const j = y / 100;

        const h = (day + (13 * (m + 1)) / 5 + k + (k / 4) + (j / 4) + (5 * j)) % 7;

        return switch (h) {
            0 => DayOfWeek.saturday,
            1 => DayOfWeek.sunday,
            2 => DayOfWeek.monday,
            3 => DayOfWeek.tuesday,
            4 => DayOfWeek.wednesday,
            5 => DayOfWeek.thursday,
            6 => DayOfWeek.friday,
            else => unreachable,
        };
    }

    // setDay cannot set day to 0 or more than the days in the month
    // ex) setDat(32) will set max day in the month
    fn setDay(self: *Self, day: Day) void {
        const y = self.getYear();
        const m = self.getMonth();
        var d = day;
        const leapKind: epoch.YearLeapKind = if (self.isLeapYear()) .leap else .not_leap;
        const daysInMonth = epoch.getDaysInMonth(leapKind, @enumFromInt(m));
        if (d > daysInMonth) {
            d = daysInMonth;
        }
        self.epochDays = epochDays(.{ .year = y, .month = m, .day = d });
    }

    // addDay  can add negative days and will adjust the date accordingly
    fn addDay(self: *Self, day: i64) void {
        if (day < 0) {
            self.epochDays -= @intCast(-day);
        } else {
            self.epochDays += @intCast(day);
        }
    }

    // setMonth cannot set month to 0 or more than 12
    fn setMonth(self: *Self, month: Month) void {
        const y = self.getYear();
        var m = month;
        if (m < 1) {
            m = 1;
        } else if (m > 12) {
            m = 12;
        }

        // adjust day
        const daysInMonth = epoch.getDaysInMonth(epoch.YearLeapKind.not_leap, @enumFromInt(m));
        var d = self.getDay();
        if (d > daysInMonth) {
            d = daysInMonth;
        }
        self.epochDays = epochDays(.{ .year = y, .month = m, .day = d });
    }

    fn addMonth(self: *Self, month: i64) void {
        var y = self.getYear();
        var m = self.getMonth();
        var d = self.getDay();
        if (month < 0) {
            m -= @intCast(-month);
        } else  {
            m += @intCast(month);
        }

        while (m < 1) {
            m += 12;
            y -= 1;
        }
        while (m > 12) {
            m -= 12;
            y += 1;
        }
        const daysInMonth = epoch.getDaysInMonth(epoch.YearLeapKind.not_leap, @enumFromInt(m));
        if (d > daysInMonth) {
            d = daysInMonth;
        }
        self.epochDays = epochDays(.{ .year = y, .month = m, .day = d });
    }

    fn setYear(self: *Self, year: Year) void {
        const y = year;
        const m = self.getMonth();
        var d = self.getDay();
        const leapKind: epoch.YearLeapKind = if (epoch.isLeapYear(y)) .leap else .not_leap;
        const daysInMonth = epoch.getDaysInMonth(leapKind, @enumFromInt(m));
        if (d > daysInMonth) {
            d = daysInMonth;
        }
        self.epochDays = epochDays(.{ .year = y, .month = m, .day = d });
    }

    fn addYear(self: *Self, year: i64) void {
        var y = self.getYear();
        y += @intCast(year);
        self.epochDays = epochDays(.{ .year = y, .month = self.getMonth(), .day = self.getDay() });
    }

    fn isLeapYear(self: Self) bool {
        return epoch.isLeapYear(self.getYear());
    }

    fn format(
        self: Self,
        fmt: []const u8,
        options: std.fmt.FormatOptions,
        writer: anytype
    ) !void {
        _ = fmt;
        _ = options;

        try writer.print("{d}-{d:0>2}-{d:0>2}", .{ self.getYear(), self.getMonth(), self.getDay() });
    }
};

pub const DayOfWeek = enum {
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday,
};

test "Date.new" {
    var d = Date.new(.{ .year = 2025, .month = 1, .day = 1 });
    try std.testing.expectEqual(2025, d.getYear());
    try std.testing.expectEqual(1, d.getMonth());
    try std.testing.expectEqual(1, d.getDay());

    d = Date.new(.{ .year = 1999, .month = 12, .day = 31 });
    try std.testing.expectEqual(1999, d.getYear());
    try std.testing.expectEqual(12, d.getMonth());
    try std.testing.expectEqual(31, d.getDay());
}

test "Date.fromUnixMills" {
    const d = Date.fromUnixMills(1736251818202);
    try std.testing.expectEqual(2025, d.getYear());
    try std.testing.expectEqual(1, d.getMonth());
    try std.testing.expectEqual(7, d.getDay());
}

test "Date.dayIndex" {
    try std.testing.expectEqual(0, Date.dayIndexOfYear(.{ .year = 2025, .month = 1, .day = 1 }));
    try std.testing.expectEqual(365, Date.dayIndexOfYear(.{ .year = 2024, .month = 12, .day = 31 }));
}

test "Date.epochDays" {
    try std.testing.expectEqual(0, Date.epochDays(.{ .year = 1970, .month = 1, .day = 1 }));
    try std.testing.expectEqual(365, Date.epochDays(.{ .year = 1971, .month = 1, .day = 1 }));
}

test "Date.getDayOfWeek" {
    try std.testing.expectEqual(DayOfWeek.thursday, Date.new(.{ .year = 1970, .month = 1, .day = 1 }).getDayOfWeek());
    try std.testing.expectEqual(DayOfWeek.tuesday, Date.new(.{ .year = 2025, .month = 1, .day = 7 }).getDayOfWeek());
}

test "Date.setDay" {
    var d = Date.new(.{ .year = 2025, .month = 1, .day = 1 });
    d.setDay(31);
    try std.testing.expectEqual(2025, d.getYear());
    try std.testing.expectEqual(1, d.getMonth());
    try std.testing.expectEqual(31, d.getDay());

    d.setDay(32);
    try std.testing.expectEqual(2025, d.getYear());
    try std.testing.expectEqual(1, d.getMonth());
    try std.testing.expectEqual(31, d.getDay());

    d.setDay(1);
    try std.testing.expectEqual(2025, d.getYear());
    try std.testing.expectEqual(1, d.getMonth());
    try std.testing.expectEqual(1, d.getDay());
}

test "Date.addDay" {
    var d = Date.new(.{ .year = 2024, .month = 12, .day = 30 });
    d.addDay(1);
    try std.testing.expectEqual(2024, d.getYear());
    try std.testing.expectEqual(12, d.getMonth());
    try std.testing.expectEqual(31, d.getDay());

    d.addDay(1);
    try std.testing.expectEqual(2025, d.getYear());
    try std.testing.expectEqual(1, d.getMonth());
    try std.testing.expectEqual(1, d.getDay());

    d.addDay(-1);
    try std.testing.expectEqual(2024, d.getYear());
    try std.testing.expectEqual(12, d.getMonth());
    try std.testing.expectEqual(31, d.getDay());
}

test "Date.setMonth" {
    var d = Date.new(.{ .year = 2025, .month = 1, .day = 1 });
    d.setMonth(11);
    try std.testing.expectEqual(2025, d.getYear());
    try std.testing.expectEqual(11, d.getMonth());
    try std.testing.expectEqual(1, d.getDay());

    d.setMonth(13);
    try std.testing.expectEqual(2025, d.getYear());
    try std.testing.expectEqual(12, d.getMonth());
    try std.testing.expectEqual(1, d.getDay());

    d.setMonth(1);
    try std.testing.expectEqual(2025, d.getYear());
    try std.testing.expectEqual(1, d.getMonth());
    try std.testing.expectEqual(1, d.getDay());
}

test "Date.addMonth" {
    var d = Date.new(.{ .year = 2024, .month = 12, .day = 30 });
    d.addMonth(1);
    try std.testing.expectEqual(2025, d.getYear());
    try std.testing.expectEqual(1, d.getMonth());
    try std.testing.expectEqual(30, d.getDay());

    d.addMonth(1);
    try std.testing.expectEqual(2025, d.getYear());
    try std.testing.expectEqual(2, d.getMonth());
    try std.testing.expectEqual(28, d.getDay());

    d.addMonth(-1);
    try std.testing.expectEqual(2025, d.getYear());
    try std.testing.expectEqual(1, d.getMonth());
    try std.testing.expectEqual(28, d.getDay());
}

test "Date.setYear" {
    var d = Date.new(.{ .year = 2025, .month = 1, .day = 1 });
    d.setYear(2024);
    try std.testing.expectEqual(2024, d.getYear());
    try std.testing.expectEqual(1, d.getMonth());
    try std.testing.expectEqual(1, d.getDay());

    d.setYear(2025);
    try std.testing.expectEqual(2025, d.getYear());
    try std.testing.expectEqual(1, d.getMonth());
    try std.testing.expectEqual(1, d.getDay());
}

test "Date.addYear" {
    var d = Date.new(.{ .year = 2000, .month = 2, .day = 29 });

    try std.testing.expectEqual(2000, d.getYear());
    try std.testing.expectEqual(2, d.getMonth());
    try std.testing.expectEqual(29, d.getDay());

    d.addYear(1);
    try std.testing.expectEqual(2001, d.getYear());
    try std.testing.expectEqual(3, d.getMonth());
    try std.testing.expectEqual(1, d.getDay());
}

test "Date.format" {
    var d = Date.new(.{ .year = 2025, .month = 1, .day = 1 });
    var buf: [64]u8 = undefined;
    var fbs = std.io.fixedBufferStream(&buf);
    try d.format("any", .{}, fbs.writer());
    try std.testing.expectEqualDeep("2025-01-01", buf[0..fbs.pos]);
}
