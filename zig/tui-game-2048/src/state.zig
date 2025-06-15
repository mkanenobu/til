const std = @import("std");
const constants = @import("constants.zig");

pub const Position = struct {
    row: usize,
    col: usize,
};

pub const Game = struct {
    board: [constants.BOARD_HEIGHT][constants.BOARD_WIDTH]u32,
    score: u32,
    game_over: bool,
    allocator: std.mem.Allocator,

    pub fn init(allocator: std.mem.Allocator) Game {
        return Game{
            .board = std.mem.zeroes([constants.BOARD_HEIGHT][constants.BOARD_WIDTH]u32),
            .score = 0,
            .game_over = false,
            .allocator = allocator,
        };
    }

    pub fn add_tile(self: *Game) !void {
        const empty_positions = try self.get_empty_positions();
        defer empty_positions.deinit();

        if (empty_positions.items.len == 0) {
            return;
        }

        var prng = std.Random.DefaultPrng.init(blk: {
            var seed: u64 = undefined;
            try std.posix.getrandom(std.mem.asBytes(&seed));
            break :blk seed;
        });
        const random = prng.random();

        const pos = empty_positions.items[random.intRangeLessThan(usize, 0, empty_positions.items.len)];
        self.board[pos.row][pos.col] = 2;
    }

    pub fn get_empty_positions(self: *Game) !std.ArrayList(Position) {
        var empty = std.ArrayList(Position).init(self.allocator);

        for (0..constants.BOARD_HEIGHT) |i| {
            for (0..constants.BOARD_WIDTH) |j| {
                if (self.board[i][j] == 0) {
                    try empty.append(Position{ .row = i, .col = j });
                }
            }
        }

        return empty;
    }

    pub fn slide_left(self: *Game) bool {
        var moved = false;

        for (0..constants.BOARD_HEIGHT) |i| {
            var new_row: [constants.BOARD_WIDTH]u32 = std.mem.zeroes([constants.BOARD_WIDTH]u32);
            var last: u32 = 0;
            var pos: usize = 0;

            for (0..constants.BOARD_WIDTH) |j| {
                const val = self.board[i][j];
                if (val == 0) {
                    continue;
                }

                if (last == val) {
                    new_row[pos - 1] *= 2;
                    self.score += new_row[pos - 1];
                    last = 0;
                    moved = true;
                } else {
                    new_row[pos] = val;
                    if (j != pos) {
                        moved = true;
                    }
                    last = val;
                    pos += 1;
                }
            }
            self.board[i] = new_row;
        }

        return moved;
    }

    pub fn slide_right(self: *Game) bool {
        self.rotate_right();
        self.rotate_right();
        const moved = self.slide_left();
        self.rotate_right();
        self.rotate_right();
        return moved;
    }

    pub fn slide_up(self: *Game) bool {
        self.rotate_left();
        const moved = self.slide_left();
        self.rotate_right();
        return moved;
    }

    pub fn slide_down(self: *Game) bool {
        self.rotate_right();
        const moved = self.slide_left();
        self.rotate_left();
        return moved;
    }

    pub fn rotate_right(self: *Game) void {
        var new_board: [constants.BOARD_HEIGHT][constants.BOARD_WIDTH]u32 = undefined;

        for (0..constants.BOARD_HEIGHT) |i| {
            for (0..constants.BOARD_WIDTH) |j| {
                new_board[j][constants.BOARD_HEIGHT - 1 - i] = self.board[i][j];
            }
        }

        self.board = new_board;
    }

    pub fn rotate_left(self: *Game) void {
        var new_board: [constants.BOARD_HEIGHT][constants.BOARD_WIDTH]u32 = undefined;

        for (0..constants.BOARD_HEIGHT) |i| {
            for (0..constants.BOARD_WIDTH) |j| {
                new_board[constants.BOARD_HEIGHT - 1 - j][i] = self.board[i][j];
            }
        }

        self.board = new_board;
    }

    pub fn can_move(self: *Game) bool {
        for (0..constants.BOARD_HEIGHT) |i| {
            for (0..constants.BOARD_WIDTH) |j| {
                if (self.board[i][j] == 0) {
                    return true;
                }
                if (i < constants.BOARD_HEIGHT - 1 and self.board[i][j] == self.board[i + 1][j]) {
                    return true;
                }
                if (j < constants.BOARD_WIDTH - 1 and self.board[i][j] == self.board[i][j + 1]) {
                    return true;
                }
            }
        }
        return false;
    }
};

// テスト
test "Game init" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const game = Game.init(allocator);

    try std.testing.expect(game.score == 0);
    try std.testing.expect(game.game_over == false);

    for (0..constants.BOARD_HEIGHT) |i| {
        for (0..constants.BOARD_WIDTH) |j| {
            try std.testing.expect(game.board[i][j] == 0);
        }
    }
}

test "add_tile" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var game = Game.init(allocator);

    try game.add_tile();
    try game.add_tile();

    var count: u32 = 0;
    for (0..constants.BOARD_HEIGHT) |i| {
        for (0..constants.BOARD_WIDTH) |j| {
            if (game.board[i][j] == 2) {
                count += 1;
            }
        }
    }

    try std.testing.expect(count == 2);
}

test "add_tile full board" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var game = Game.init(allocator);

    for (0..constants.BOARD_HEIGHT) |i| {
        for (0..constants.BOARD_WIDTH) |j| {
            game.board[i][j] = 2;
        }
    }

    try game.add_tile();

    for (0..constants.BOARD_HEIGHT) |i| {
        for (0..constants.BOARD_WIDTH) |j| {
            try std.testing.expect(game.board[i][j] == 2);
        }
    }
}

test "get_empty_positions" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var game = Game.init(allocator);

    const empty = try game.get_empty_positions();
    defer empty.deinit();

    const expected = constants.BOARD_WIDTH * constants.BOARD_HEIGHT;
    try std.testing.expect(empty.items.len == expected);

    game.board[0][0] = 2;
    game.board[1][1] = 4;

    const empty2 = try game.get_empty_positions();
    defer empty2.deinit();

    const expected2 = constants.BOARD_WIDTH * constants.BOARD_HEIGHT - 2;
    try std.testing.expect(empty2.items.len == expected2);
}

test "slide_left basic" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var game = Game.init(allocator);
    game.board[0] = [4]u32{ 2, 0, 2, 0 };

    const moved = game.slide_left();

    try std.testing.expect(moved == true);
    try std.testing.expect(game.score == 4);
    try std.testing.expect(game.board[0][0] == 4);
    try std.testing.expect(game.board[0][1] == 0);
    try std.testing.expect(game.board[0][2] == 0);
    try std.testing.expect(game.board[0][3] == 0);
}

test "slide_left move only" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var game = Game.init(allocator);
    game.board[0] = [4]u32{ 0, 2, 0, 4 };

    const moved = game.slide_left();

    try std.testing.expect(moved == true);
    try std.testing.expect(game.score == 0);
    try std.testing.expect(game.board[0][0] == 2);
    try std.testing.expect(game.board[0][1] == 4);
    try std.testing.expect(game.board[0][2] == 0);
    try std.testing.expect(game.board[0][3] == 0);
}

test "slide_left no move" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var game = Game.init(allocator);
    game.board[0] = [4]u32{ 2, 4, 8, 16 };

    const moved = game.slide_left();

    try std.testing.expect(moved == false);
    try std.testing.expect(game.score == 0);
    try std.testing.expect(game.board[0][0] == 2);
    try std.testing.expect(game.board[0][1] == 4);
    try std.testing.expect(game.board[0][2] == 8);
    try std.testing.expect(game.board[0][3] == 16);
}

test "slide_right" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var game = Game.init(allocator);
    game.board[0] = [4]u32{ 2, 0, 2, 0 };

    const moved = game.slide_right();

    try std.testing.expect(moved == true);
    try std.testing.expect(game.board[0][0] == 0);
    try std.testing.expect(game.board[0][1] == 0);
    try std.testing.expect(game.board[0][2] == 0);
    try std.testing.expect(game.board[0][3] == 4);
}

test "slide_up" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var game = Game.init(allocator);
    game.board[0][0] = 2;
    game.board[1][0] = 0;
    game.board[2][0] = 2;
    game.board[3][0] = 0;

    const moved = game.slide_up();

    try std.testing.expect(moved == true);
    try std.testing.expect(game.board[0][0] == 4);
    try std.testing.expect(game.board[1][0] == 0);
    try std.testing.expect(game.board[2][0] == 0);
    try std.testing.expect(game.board[3][0] == 0);
}

test "slide_down" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var game = Game.init(allocator);
    game.board[0][0] = 2;
    game.board[1][0] = 0;
    game.board[2][0] = 2;
    game.board[3][0] = 0;

    const moved = game.slide_down();

    try std.testing.expect(moved == true);
    try std.testing.expect(game.board[0][0] == 0);
    try std.testing.expect(game.board[1][0] == 0);
    try std.testing.expect(game.board[2][0] == 0);
    try std.testing.expect(game.board[3][0] == 4);
}

test "rotate_right" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var game = Game.init(allocator);
    game.board = [4][4]u32{
        [4]u32{ 1, 2, 3, 4 },
        [4]u32{ 5, 6, 7, 8 },
        [4]u32{ 9, 10, 11, 12 },
        [4]u32{ 13, 14, 15, 16 },
    };

    game.rotate_right();

    const expected = [4][4]u32{
        [4]u32{ 13, 9, 5, 1 },
        [4]u32{ 14, 10, 6, 2 },
        [4]u32{ 15, 11, 7, 3 },
        [4]u32{ 16, 12, 8, 4 },
    };

    try std.testing.expect(std.mem.eql(u32, &game.board[0], &expected[0]));
    try std.testing.expect(std.mem.eql(u32, &game.board[1], &expected[1]));
    try std.testing.expect(std.mem.eql(u32, &game.board[2], &expected[2]));
    try std.testing.expect(std.mem.eql(u32, &game.board[3], &expected[3]));
}

test "rotate_left" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var game = Game.init(allocator);
    game.board = [4][4]u32{
        [4]u32{ 1, 2, 3, 4 },
        [4]u32{ 5, 6, 7, 8 },
        [4]u32{ 9, 10, 11, 12 },
        [4]u32{ 13, 14, 15, 16 },
    };

    game.rotate_left();

    const expected = [4][4]u32{
        [4]u32{ 4, 8, 12, 16 },
        [4]u32{ 3, 7, 11, 15 },
        [4]u32{ 2, 6, 10, 14 },
        [4]u32{ 1, 5, 9, 13 },
    };

    try std.testing.expect(std.mem.eql(u32, &game.board[0], &expected[0]));
    try std.testing.expect(std.mem.eql(u32, &game.board[1], &expected[1]));
    try std.testing.expect(std.mem.eql(u32, &game.board[2], &expected[2]));
    try std.testing.expect(std.mem.eql(u32, &game.board[3], &expected[3]));
}

test "rotate_right_then_left" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var game = Game.init(allocator);
    const original = [4][4]u32{
        [4]u32{ 1, 2, 3, 4 },
        [4]u32{ 5, 6, 7, 8 },
        [4]u32{ 9, 10, 11, 12 },
        [4]u32{ 13, 14, 15, 16 },
    };
    game.board = original;

    game.rotate_right();
    game.rotate_left();

    try std.testing.expect(std.mem.eql(u32, &game.board[0], &original[0]));
    try std.testing.expect(std.mem.eql(u32, &game.board[1], &original[1]));
    try std.testing.expect(std.mem.eql(u32, &game.board[2], &original[2]));
    try std.testing.expect(std.mem.eql(u32, &game.board[3], &original[3]));
}

test "can_move with empty space" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var game = Game.init(allocator);
    game.board = [4][4]u32{
        [4]u32{ 2, 4, 8, 16 },
        [4]u32{ 4, 8, 16, 32 },
        [4]u32{ 8, 16, 32, 64 },
        [4]u32{ 16, 32, 64, 0 },
    };

    try std.testing.expect(game.can_move() == true);
}

test "can_move with horizontal merge" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var game = Game.init(allocator);
    game.board = [4][4]u32{
        [4]u32{ 2, 4, 8, 16 },
        [4]u32{ 4, 8, 16, 32 },
        [4]u32{ 8, 16, 32, 64 },
        [4]u32{ 16, 32, 64, 64 },
    };

    try std.testing.expect(game.can_move() == true);
}

test "can_move with vertical merge" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var game = Game.init(allocator);
    game.board = [4][4]u32{
        [4]u32{ 2, 4, 8, 16 },
        [4]u32{ 4, 8, 16, 32 },
        [4]u32{ 8, 16, 32, 64 },
        [4]u32{ 8, 32, 64, 128 },
    };

    try std.testing.expect(game.can_move() == true);
}

test "can_move game over" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var game = Game.init(allocator);
    game.board = [4][4]u32{
        [4]u32{ 2, 4, 8, 16 },
        [4]u32{ 4, 8, 16, 32 },
        [4]u32{ 8, 16, 32, 64 },
        [4]u32{ 16, 32, 64, 128 },
    };

    try std.testing.expect(game.can_move() == false);
}

test "can_move empty board" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var game = Game.init(allocator);

    try std.testing.expect(game.can_move() == true);
}
