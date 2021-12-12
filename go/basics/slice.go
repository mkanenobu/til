package main

import (
	"fmt"
	"strings"
)

func static() {
	// static length
	var s [3]string
	s[0] = "1"
	s[1] = "2"

	fmt.Printf("%q\n", s)
	fmt.Printf("%q\n", s[1])

	arr2 := []int{1, 2, 3, 4}
	fmt.Printf("%d\n", arr2)
}

func dynamic() {
	s := []int{}

	_ = append(s, 1)
	_ = append(s, 3)
	_ = append(s, 2)
	fmt.Printf("%q\n", s)
}

func _map() {
	m1 := make(map[string]int, 2)
	fmt.Printf("%+v\n", m1)
	fmt.Printf("%+v\n", len(m1))
	m1["key1"] = 1
	m1["key2"] = 14
	m1["key3"] = 51
	m1["key4"] = 111
	fmt.Printf("%+v\n", m1)

	m2 := map[string]string{"key": "value", "k": "v"}
	fmt.Printf("%+v\n", m2)
}

func loop() {
	st := "Hello, World! My name is john doe."
	for i, s := range strings.Split(st, " ") {
		fmt.Printf("index: %d, string: %s\n", i, s)
	}
}

func main() {
	static()
	dynamic()
	_map()
	loop()
}
