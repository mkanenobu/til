package main

import (
	"fmt"
	"math/rand"
	"time"
)

func randomWait() {
	n := rand.Intn(1000)
	time.Sleep(time.Duration(n) * time.Millisecond)
}

func main() {
	ch := make(chan string)

	go (func() {
		randomWait()
		ch <- "A"
	})()

	go (func() {
		randomWait()
		ch <- "B"
	})()

	first := <-ch
	fmt.Printf("The first goroutine to send a value was: %s\n", first)
}
