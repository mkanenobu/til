package main

import (
	"testing"
)

func TestGame_AddTile(t *testing.T) {
	game := &Game{}

	// 空のボードに2つのタイルを追加
	game.AddTile()
	game.AddTile()

	// ボード上に合計2つのタイル（値2）があることを確認
	count := 0
	for i := 0; i < BoardHeight; i++ {
		for j := 0; j < BoardWidth; j++ {
			if game.Board[i][j] == 2 {
				count++
			}
		}
	}

	if count != 2 {
		t.Errorf("Expected 2 tiles with value 2, got %d", count)
	}
}

func TestGame_AddTile_FullBoard(t *testing.T) {
	game := &Game{}

	// ボードを満杯にする
	for i := 0; i < BoardHeight; i++ {
		for j := 0; j < BoardWidth; j++ {
			game.Board[i][j] = 2
		}
	}

	// 満杯のボードにタイルを追加しようとする
	game.AddTile()

	// ボードの状態が変わらないことを確認
	for i := 0; i < BoardHeight; i++ {
		for j := 0; j < BoardWidth; j++ {
			if game.Board[i][j] != 2 {
				t.Errorf("Board should remain unchanged when full")
			}
		}
	}
}

func TestGame_getEmptyPositions(t *testing.T) {
	game := &Game{}

	// 空のボードでは16個の空き位置があることを確認
	empty := game.getEmptyPositions()
	expected := BoardWidth * BoardHeight
	if len(empty) != expected {
		t.Errorf("Expected %d empty positions, got %d", expected, len(empty))
	}

	// いくつかの位置にタイルを配置
	game.Board[0][0] = 2
	game.Board[1][1] = 4

	empty = game.getEmptyPositions()
	expected = BoardWidth*BoardHeight - 2
	if len(empty) != expected {
		t.Errorf("Expected %d empty positions, got %d", expected, len(empty))
	}
}

func TestGame_SlideLeft(t *testing.T) {
	tests := []struct {
		name     string
		initial  [BoardHeight][BoardWidth]int
		expected [BoardHeight][BoardWidth]int
		moved    bool
		score    int
	}{
		{
			name: "基本的な左スライド",
			initial: [BoardHeight][BoardWidth]int{
				{2, 0, 2, 0},
				{0, 0, 0, 0},
				{0, 0, 0, 0},
				{0, 0, 0, 0},
			},
			expected: [BoardHeight][BoardWidth]int{
				{4, 0, 0, 0},
				{0, 0, 0, 0},
				{0, 0, 0, 0},
				{0, 0, 0, 0},
			},
			moved: true,
			score: 4,
		},
		{
			name: "移動のみ（結合なし）",
			initial: [BoardHeight][BoardWidth]int{
				{0, 2, 0, 4},
				{0, 0, 0, 0},
				{0, 0, 0, 0},
				{0, 0, 0, 0},
			},
			expected: [BoardHeight][BoardWidth]int{
				{2, 4, 0, 0},
				{0, 0, 0, 0},
				{0, 0, 0, 0},
				{0, 0, 0, 0},
			},
			moved: true,
			score: 0,
		},
		{
			name: "移動なし",
			initial: [BoardHeight][BoardWidth]int{
				{2, 4, 8, 16},
				{0, 0, 0, 0},
				{0, 0, 0, 0},
				{0, 0, 0, 0},
			},
			expected: [BoardHeight][BoardWidth]int{
				{2, 4, 8, 16},
				{0, 0, 0, 0},
				{0, 0, 0, 0},
				{0, 0, 0, 0},
			},
			moved: false,
			score: 0,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			game := &Game{Board: tt.initial, Score: 0}
			moved := game.SlideLeft()

			if moved != tt.moved {
				t.Errorf("Expected moved=%v, got %v", tt.moved, moved)
			}

			if game.Score != tt.score {
				t.Errorf("Expected score=%d, got %d", tt.score, game.Score)
			}

			if game.Board != tt.expected {
				t.Errorf("Expected board=%v, got %v", tt.expected, game.Board)
			}
		})
	}
}

func TestGame_SlideRight(t *testing.T) {
	game := &Game{}
	game.Board = [BoardHeight][BoardWidth]int{
		{2, 0, 2, 0},
		{0, 0, 0, 0},
		{0, 0, 0, 0},
		{0, 0, 0, 0},
	}

	moved := game.SlideRight()

	expected := [BoardHeight][BoardWidth]int{
		{0, 0, 0, 4},
		{0, 0, 0, 0},
		{0, 0, 0, 0},
		{0, 0, 0, 0},
	}

	if !moved {
		t.Error("Expected SlideRight to return true for valid move")
	}

	if game.Board != expected {
		t.Errorf("Expected board=%v, got %v", expected, game.Board)
	}
}

func TestGame_SlideUp(t *testing.T) {
	game := &Game{}
	game.Board = [BoardHeight][BoardWidth]int{
		{2, 0, 0, 0},
		{0, 0, 0, 0},
		{2, 0, 0, 0},
		{0, 0, 0, 0},
	}

	moved := game.SlideUp()

	expected := [BoardHeight][BoardWidth]int{
		{4, 0, 0, 0},
		{0, 0, 0, 0},
		{0, 0, 0, 0},
		{0, 0, 0, 0},
	}

	if !moved {
		t.Error("Expected SlideUp to return true for valid move")
	}

	if game.Board != expected {
		t.Errorf("Expected board=%v, got %v", expected, game.Board)
	}
}

func TestGame_SlideDown(t *testing.T) {
	game := &Game{}
	game.Board = [BoardHeight][BoardWidth]int{
		{2, 0, 0, 0},
		{0, 0, 0, 0},
		{2, 0, 0, 0},
		{0, 0, 0, 0},
	}

	moved := game.SlideDown()

	expected := [BoardHeight][BoardWidth]int{
		{0, 0, 0, 0},
		{0, 0, 0, 0},
		{0, 0, 0, 0},
		{4, 0, 0, 0},
	}

	if !moved {
		t.Error("Expected SlideDown to return true for valid move")
	}

	if game.Board != expected {
		t.Errorf("Expected board=%v, got %v", expected, game.Board)
	}
}

func TestGame_RotateRight(t *testing.T) {
	game := &Game{}
	game.Board = [BoardHeight][BoardWidth]int{
		{1, 2, 3, 4},
		{5, 6, 7, 8},
		{9, 10, 11, 12},
		{13, 14, 15, 16},
	}

	game.RotateRight()

	expected := [BoardHeight][BoardWidth]int{
		{13, 9, 5, 1},
		{14, 10, 6, 2},
		{15, 11, 7, 3},
		{16, 12, 8, 4},
	}

	if game.Board != expected {
		t.Errorf("Expected board=%v, got %v", expected, game.Board)
	}
}

func TestGame_RotateLeft(t *testing.T) {
	game := &Game{}
	game.Board = [BoardHeight][BoardWidth]int{
		{1, 2, 3, 4},
		{5, 6, 7, 8},
		{9, 10, 11, 12},
		{13, 14, 15, 16},
	}

	game.RotateLeft()

	expected := [BoardHeight][BoardWidth]int{
		{4, 8, 12, 16},
		{3, 7, 11, 15},
		{2, 6, 10, 14},
		{1, 5, 9, 13},
	}

	if game.Board != expected {
		t.Errorf("Expected board=%v, got %v", expected, game.Board)
	}
}

func TestGame_RotateRightThenLeft(t *testing.T) {
	game := &Game{}
	original := [BoardHeight][BoardWidth]int{
		{1, 2, 3, 4},
		{5, 6, 7, 8},
		{9, 10, 11, 12},
		{13, 14, 15, 16},
	}
	game.Board = original

	// 右回転してから左回転すると元に戻る
	game.RotateRight()
	game.RotateLeft()

	if game.Board != original {
		t.Errorf("Expected board to return to original=%v, got %v", original, game.Board)
	}
}

func TestGame_CanMove(t *testing.T) {
	tests := []struct {
		name     string
		board    [BoardHeight][BoardWidth]int
		expected bool
	}{
		{
			name: "空きスペースがある場合",
			board: [BoardHeight][BoardWidth]int{
				{2, 4, 8, 16},
				{4, 8, 16, 32},
				{8, 16, 32, 64},
				{16, 32, 64, 0},
			},
			expected: true,
		},
		{
			name: "水平方向に結合可能な隣接タイルがある場合",
			board: [BoardHeight][BoardWidth]int{
				{2, 4, 8, 16},
				{4, 8, 16, 32},
				{8, 16, 32, 64},
				{16, 32, 64, 64},
			},
			expected: true,
		},
		{
			name: "垂直方向に結合可能な隣接タイルがある場合",
			board: [BoardHeight][BoardWidth]int{
				{2, 4, 8, 16},
				{4, 8, 16, 32},
				{8, 16, 32, 64},
				{8, 32, 64, 128},
			},
			expected: true,
		},
		{
			name: "移動不可能（ゲームオーバー）",
			board: [BoardHeight][BoardWidth]int{
				{2, 4, 8, 16},
				{4, 8, 16, 32},
				{8, 16, 32, 64},
				{16, 32, 64, 128},
			},
			expected: false,
		},
		{
			name: "完全に空のボード",
			board: [BoardHeight][BoardWidth]int{
				{0, 0, 0, 0},
				{0, 0, 0, 0},
				{0, 0, 0, 0},
				{0, 0, 0, 0},
			},
			expected: true,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			game := &Game{Board: tt.board}
			result := game.CanMove()

			if result != tt.expected {
				t.Errorf("Expected CanMove()=%v, got %v", tt.expected, result)
			}
		})
	}
}
