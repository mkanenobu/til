package main

import (
	"reverse-polish-calculator/parse"
	"reverse-polish-calculator/stack"
)

func main() {
	st := stack.CreateStack(10)
	stack.LogStack(st)

	parse.ReadLine(st)
}
