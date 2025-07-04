package main

import "math/rand/v2"

type Position struct {
	Row, Col int
}

type Game struct {
	Board    [BoardHeight][BoardWidth]int
	Score    int
	GameOver bool
}

func (g *Game) AddTile() {
	empty := g.getEmptyPositions()
	if len(empty) == 0 {
		return
	}
	pos := empty[rand.IntN(len(empty))]
	g.Board[pos.Row][pos.Col] = 2
}

func (g *Game) getEmptyPositions() []Position {
	var empty []Position
	for i := range g.Board {
		for j := range g.Board[i] {
			if g.Board[i][j] == 0 {
				empty = append(empty, Position{Row: i, Col: j})
			}
		}
	}
	return empty
}

func (g *Game) SlideLeft() bool {
	moved := false
	for i := 0; i < BoardHeight; i++ {
		var newRow [BoardWidth]int
		var last int
		pos := 0
		for j := 0; j < BoardWidth; j++ {
			val := g.Board[i][j]
			if val == 0 {
				continue
			}
			if last == val {
				newRow[pos-1] *= 2
				g.Score += newRow[pos-1]
				last = 0
				moved = true
			} else {
				newRow[pos] = val
				if j != pos {
					moved = true
				}
				last = val
				pos++
			}
		}
		g.Board[i] = newRow
	}
	return moved
}

func (g *Game) SlideRight() bool {
	g.RotateRight()
	g.RotateRight()
	moved := g.SlideLeft()
	g.RotateRight()
	g.RotateRight()
	return moved
}

func (g *Game) SlideUp() bool {
	g.RotateLeft()
	moved := g.SlideLeft()
	g.RotateRight()
	return moved
}

func (g *Game) SlideDown() bool {
	g.RotateRight()
	moved := g.SlideLeft()
	g.RotateLeft()
	return moved
}

func (g *Game) RotateRight() {
	var newBoard [BoardHeight][BoardWidth]int
	for i := 0; i < BoardHeight; i++ {
		for j := 0; j < BoardWidth; j++ {
			newBoard[j][BoardHeight-1-i] = g.Board[i][j]
		}
	}
	g.Board = newBoard
}

func (g *Game) RotateLeft() {
	var newBoard [BoardHeight][BoardWidth]int
	for i := 0; i < BoardHeight; i++ {
		for j := 0; j < BoardWidth; j++ {
			newBoard[BoardHeight-1-j][i] = g.Board[i][j]
		}
	}
	g.Board = newBoard
}

func (g *Game) CanMove() bool {
	for i := 0; i < BoardHeight; i++ {
		for j := 0; j < BoardWidth; j++ {
			if g.Board[i][j] == 0 {
				return true
			}
			if i < BoardHeight-1 && g.Board[i][j] == g.Board[i+1][j] {
				return true
			}
			if j < BoardWidth-1 && g.Board[i][j] == g.Board[i][j+1] {
				return true
			}
		}
	}
	return false
}
