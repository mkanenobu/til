const std = @import("std");
const state = @import("state.zig");
const draw = @import("draw.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var game = state.Game.init(allocator);

    try game.add_tile();
    try game.add_tile();

    const stdout = std.io.getStdOut().writer();
    const stdin = std.io.getStdIn().reader();

    // 端末を raw モードに設定
    try setup_terminal();
    defer restore_terminal() catch {};

    try draw.draw_board(&game, stdout);

    try run_game_loop(&game, stdin);

    try draw.show_game_over(stdout);

    // 最後の入力を待つ
    _ = try stdin.readByte();
}

fn setup_terminal() !void {
    // 端末をraw modeに設定するためのシステムコール（POSIX）
    const stdin_fd = std.posix.STDIN_FILENO;

    const old_termios = try std.posix.tcgetattr(stdin_fd);
    var new_termios = old_termios;

    // raw mode設定
    new_termios.lflag.ECHO = false;
    new_termios.lflag.ICANON = false;
    new_termios.cc[@intFromEnum(std.posix.V.MIN)] = 1;
    new_termios.cc[@intFromEnum(std.posix.V.TIME)] = 0;

    try std.posix.tcsetattr(stdin_fd, .NOW, new_termios);
}

fn restore_terminal() !void {
    const stdin_fd = std.posix.STDIN_FILENO;

    var termios_orig = try std.posix.tcgetattr(stdin_fd);
    termios_orig.lflag.ECHO = true;
    termios_orig.lflag.ICANON = true;

    try std.posix.tcsetattr(stdin_fd, .NOW, termios_orig);
}

fn run_game_loop(game: *state.Game, stdin: anytype) !void {
    while (!game.game_over) {
        const input = try stdin.readByte();

        if (try handle_input(input, game)) {
            return; // ESCまたはCtrl+Cで終了
        }

        if (!game.can_move()) {
            game.game_over = true;
        }
    }
}

fn handle_input(input: u8, game: *state.Game) !bool {
    const stdout = std.io.getStdOut().writer();
    var moved = false;

    switch (input) {
        27 => { // ESC key
            const next = std.io.getStdIn().reader().readByte() catch return true;
            if (next == '[') {
                const arrow = try std.io.getStdIn().reader().readByte();
                switch (arrow) {
                    'A' => moved = game.slide_up(), // Up arrow
                    'B' => moved = game.slide_down(), // Down arrow
                    'C' => moved = game.slide_right(), // Right arrow
                    'D' => moved = game.slide_left(), // Left arrow
                    else => {},
                }
            } else {
                return true; // Pure ESC - exit
            }
        },
        3 => return true, // Ctrl+C
        'w', 'W' => moved = game.slide_up(),
        's', 'S' => moved = game.slide_down(),
        'a', 'A' => moved = game.slide_left(),
        'd', 'D' => moved = game.slide_right(),
        'q', 'Q' => return true,
        else => {},
    }

    if (moved) {
        try game.add_tile();
        try draw.draw_board(game, stdout);
    }

    return false;
}

// テスト用のエクスポート
pub const testing = struct {
    pub const Game = state.Game;
    pub const draw_board = draw.draw_board;
};
