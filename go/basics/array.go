package main

import (
	"fmt"
)

func arr() {
	// static length
	var arr [3]string
	arr[0] = "1"
	arr[1] = "2"

	fmt.Printf("%q\n", arr)
	fmt.Printf("%q\n", arr[1])

	arr2 := []int{1, 2, 3, 4}
	fmt.Printf("%d\n", arr2)
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

func main() {
	arr()
	_map()
}
