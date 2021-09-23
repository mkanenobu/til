package main

import (
	"fmt"
	"log"
)

// 1, 3, 2
func example1() {
	fmt.Println(1)
	defer fmt.Println(2)
	fmt.Println(3)
}

// 1, 2, 3, log
func example2() {
	fmt.Println(1)
	defer log.Println(fmt.Println(2))
	fmt.Println(3)
}

// 1, 3, 2, log
func example3() {
	fmt.Println(1)
	defer func() {
		log.Println(fmt.Println(2))
	}()
	fmt.Println(3)
}

func main() {
	example1()

	fmt.Println()

	example2()

	fmt.Println()

	example3()
}
