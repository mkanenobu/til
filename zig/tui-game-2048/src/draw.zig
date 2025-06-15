const std = @import("std");
const state = @import("state.zig");
const constants = @import("constants.zig");

fn print_padded_number(writer: anytype, val: u32) !void {
    const digits = if (val == 0) 1 else std.math.log10_int(val) + 1;
    const padding = 5 - digits;

    var i: usize = 0;
    while (i < padding) : (i += 1) {
        try writer.print(" ", .{});
    }
    try writer.print("{d}", .{val});
}

pub fn draw_board(game: *state.Game, writer: anytype) !void {
    try clear_screen(writer);

    const cell_width = 6;

    // 水平線を描画
    for (0..constants.BOARD_HEIGHT + 1) |i| {
        for (0..constants.BOARD_WIDTH * cell_width) |_| {
            try writer.print("-", .{});
        }
        try writer.print("\n", .{});

        if (i < constants.BOARD_HEIGHT) {
            // 垂直線と数値を描画
            for (0..constants.BOARD_WIDTH) |j| {
                try writer.print("|", .{});
                const val = game.board[i][j];
                if (val == 0) {
                    try writer.print("     ", .{});
                } else {
                    try print_padded_number(writer, val);
                }
            }
            try writer.print("|\n", .{});
        }
    }

    try writer.print("Score: {d}\n", .{game.score});
    try writer.print("Use arrow keys to move, ESC to quit\n", .{});
}

pub fn clear_screen(writer: anytype) !void {
    // ANSI escape sequence to clear screen and move cursor to top-left
    try writer.print("\x1B[2J\x1B[H", .{});
}

pub fn show_game_over(writer: anytype) !void {
    try clear_screen(writer);
    try writer.print("Game Over! Press any key to exit.\n", .{});
}
