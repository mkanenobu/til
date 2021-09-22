package main

import (
	"fmt"
	"math/rand"
	"time"
)

func f(from string) {
	for i := 0; i < 3; i++ {
		time.Sleep(time.Millisecond * time.Duration(100*rand.Int63n(10)))
		fmt.Println(from, ":", i)
	}
}

func main() {
	go f("goroutine")

	go func(msg string) {
		fmt.Println(msg)
	}("going")

	f("direct")

	time.Sleep(time.Second)
	fmt.Println("done")
}
