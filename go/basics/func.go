package main

import "fmt"

type Calc func(a int, b int) int

func main() {
	var add Calc
	var sub Calc
	var multi Calc
	var div Calc

	add = func(a int, b int) int {
		return a + b
	}
	sub = func(a int, b int) int {
		return a - b
	}
	multi = func(a int, b int) int {
		return a * b
	}
	div = func(a int, b int) int {
		return a / b
	}

	fmt.Println(add(1, 2))
	fmt.Println(sub(1, 2))
	fmt.Println(multi(1, 2))
	fmt.Println(div(1, 2))
	fmt.Println(div(multi(sub(add(100, 2), 3), 4), 5))
}
