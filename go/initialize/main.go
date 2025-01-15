package main

import (
	"fmt"
	"strconv"
)

func main() {
	t := Initialize[MyInt]()
	fmt.Printf("%s\n", t.String())
}

type Stringer interface {
	String() string
}

func Initialize[T Stringer]() T {
	var t T
	fmt.Printf("%s\n", t.String())
	return t
}

type MyInt int

func (i MyInt) String() string {
	return strconv.Itoa(int(i))
}
