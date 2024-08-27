package main

import "fmt"

var nestedMap = map[string]map[string]int{
	"key1": {
		"key1-1": 1,
		"key1-2": 2,
	},
	"key2": {
		"key2-1": 3,
		"key2-2": 4,
	},
}

func main() {
	v, ok := nestedMap["key1"]["key1-1"]
	fmt.Printf("key1 > key1-1: %d, %t\n", v, ok)

	// not exists
	v, ok = nestedMap["key3"]["key3-1"]
	fmt.Printf("key3 > key3-1: %d, %t\n", v, ok)

	// nested key is not exists
	v, ok = nestedMap["key1"]["key1-3"]
	fmt.Printf("key1 > key1-3: %d, %t\n", v, ok)
}
