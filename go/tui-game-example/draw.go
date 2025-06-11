package main

import (
	"fmt"
	"github.com/gdamore/tcell/v2"
)

func DrawBoard(s tcell.Screen, g *Game) {
	s.Clear()
	style := tcell.StyleDefault
	cellWidth := 6
	cellHeight := 2

	// Draw horizontal lines
	for i := 0; i <= BoardHeight; i++ {
		for j := 0; j < BoardWidth*cellWidth; j++ {
			s.SetContent(j, i*cellHeight, '-', nil, style)
		}
	}

	// Draw vertical lines and numbers
	for i := 0; i < BoardHeight; i++ {
		for j := 0; j <= BoardWidth; j++ {
			s.SetContent(j*cellWidth, i*cellHeight+1, '|', nil, style)
		}
		for j := 0; j < BoardWidth; j++ {
			val := g.Board[i][j]
			var str string
			if val == 0 {
				str = "     "
			} else {
				str = fmt.Sprintf("%5d", val)
			}
			for k, r := range str {
				s.SetContent(j*cellWidth+1+k, i*cellHeight+1, r, nil, style)
			}
		}
	}

	s.Show()
}
