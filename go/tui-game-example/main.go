package main

import (
	"github.com/gdamore/tcell/v2"
)

func main() {
	screen, _ := tcell.NewScreen()
	screen.Init()
	defer screen.Fini()

	game := &Game{}
	game.AddTile()
	game.AddTile()
	DrawBoard(screen, game)

	for !game.GameOver {
		ev := screen.PollEvent()
		switch ev := ev.(type) {
		case *tcell.EventKey:
			var moved bool
			switch ev.Key() {
			case tcell.KeyLeft:
				moved = game.SlideLeft()
			case tcell.KeyRight:
				game.RotateRight()
				game.RotateRight()
				moved = game.SlideLeft()
				game.RotateRight()
				game.RotateRight()
			case tcell.KeyUp:
				game.RotateLeft()
				moved = game.SlideLeft()
				game.RotateRight()
			case tcell.KeyDown:
				game.RotateRight()
				moved = game.SlideLeft()
				game.RotateLeft()
			case tcell.KeyEscape, tcell.KeyCtrlC:
				return
			}
			if moved {
				game.AddTile()
				DrawBoard(screen, game)
				if !game.CanMove() {
					game.GameOver = true
				}
			}
		}
	}

	screen.Clear()
	str := "Game Over! Press any key to exit."
	for i, r := range str {
		screen.SetContent(i, 0, r, nil, tcell.StyleDefault)
	}
	screen.Show()
	screen.PollEvent()
}
