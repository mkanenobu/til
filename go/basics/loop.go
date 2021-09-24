package main

import "fmt"

func normal() {
	for i := 0; i < 3; i++ {
		fmt.Println(i)
	}
}

func while() {
	i := 0
	for i < 3 {
		fmt.Println(i)
		i++
	}

	i = 0
	for {
		fmt.Println(i)
		i++
		if i == 3 {
			break
		}
	}
}

func foreach() {
	arr := []int{0, 1, 2}
	for i := range arr {
		fmt.Println(i)
	}

	m := map[string]int{"zero": 0, "one": 1, "two": 2}
	for k, v := range m {
		fmt.Println(k, v)
	}
}

func main() {
	normal()
	while()
	foreach()
}
