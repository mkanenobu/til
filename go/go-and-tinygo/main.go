package main

import "fmt"

func main() {
	fmt.Println("Hello, World!")

	n := Tarai(15, 7, 0)
	fmt.Printf("%v\n", n)
}

func Tarai(x, y, z int) int {
	if x <= y {
		return y
	}
	return Tarai(Tarai(x-1, y, z), Tarai(y-1, z, x), Tarai(z-1, x, y))
}
