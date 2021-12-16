package main

import (
	"fmt"
	"strings"
)

func repeat[T any](elm T, count int) []T {
	s := []T{}

	for i := 0; i < count; i++ {
		s = append(s, elm)
	}
	return s
}

func sliceMap[T any](slice []T, f func(e T) T) []T {
	r := []T{}
	for _, e := range slice {
		r = append(r, f(e))
	}
	return r
}

func main() {
	// repeat
	fmt.Printf("%v\n", repeat(1, 3))
	fmt.Printf("%v\n", repeat("str", 3))

	// map
	s := []int{3, 2, 1}
	double := func(n int) int { return n * 2 }
	fmt.Printf("%v\n", sliceMap(s, double))

	s2 := []string{"  Hello, ", " World   ", " !"}
	fmt.Printf("%v\n", sliceMap(s2, strings.TrimSpace))
}
