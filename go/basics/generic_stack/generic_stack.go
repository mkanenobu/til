package main

import "fmt"

type GenericStack[T any] []T

func Create[T any]() *GenericStack[T] {
	return &GenericStack[T]{}
}

func (s *GenericStack[T]) Put(v T) {
	*s = append(*s, v)
}

func (s *GenericStack[T]) Pop() T {
	old := *s
	v := old[len(old)-1]
	*s = old[:len(old)-1]
	return v
}

func main() {
	s := Create[int]()
	s.Put(1)
	s.Put(2)

	fmt.Printf("%v\n", s)

	fmt.Printf("%v\n", s.Pop())
	fmt.Printf("%v\n", s.Pop())
}
