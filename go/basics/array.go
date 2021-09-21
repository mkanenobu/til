package main

import (
	"fmt"
)

func main() {
	var arr [3]string
	arr[0] = "1"
	arr[1] = "2"

	fmt.Printf("%q\n", arr)
	fmt.Printf("%q\n", arr[1])

	arr2 := []int{1, 2, 3}
	fmt.Printf("%d\n", arr2)
}
