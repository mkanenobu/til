package main

import (
	"github.com/gdamore/tcell/v2"
)

func main() {
	screen, err := initScreen()
	if err != nil {
		panic(err)
	}
	defer screen.Fini()

	game := &Game{}
	game.AddTile()
	game.AddTile()
	DrawBoard(screen, game)

	runGameLoop(screen, game)
	showGameOver(screen)
}

func initScreen() (tcell.Screen, error) {
	screen, err := tcell.NewScreen()
	if err != nil {
		return nil, err
	}
	if err := screen.Init(); err != nil {
		return nil, err
	}
	return screen, nil
}

func runGameLoop(screen tcell.Screen, game *Game) {
	for !game.GameOver {
		ev := screen.PollEvent()
		if shouldExit := handleInput(ev, game, screen); shouldExit {
			return
		}
	}
}

func handleInput(ev tcell.Event, game *Game, screen tcell.Screen) bool {
	switch ev := ev.(type) {
	case *tcell.EventKey:
		moved := processKeyPress(ev.Key(), game)
		if moved {
			game.AddTile()
			DrawBoard(screen, game)
			if !game.CanMove() {
				game.GameOver = true
			}
		}
		return ev.Key() == tcell.KeyEscape || ev.Key() == tcell.KeyCtrlC
	}
	return false
}

func processKeyPress(key tcell.Key, game *Game) bool {
	switch key {
	case tcell.KeyLeft:
		return game.SlideLeft()
	case tcell.KeyRight:
		return game.SlideRight()
	case tcell.KeyUp:
		return game.SlideUp()
	case tcell.KeyDown:
		return game.SlideDown()
	}
	return false
}

func showGameOver(screen tcell.Screen) {
	screen.Clear()
	str := "Game Over! Press any key to exit."
	for i, r := range str {
		screen.SetContent(i, 0, r, nil, tcell.StyleDefault)
	}
	screen.Show()
	screen.PollEvent()
}
