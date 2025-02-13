package main

import (
	"log"
	"time"
)

func main() {
	for t := range createStream(5) {
		log.Printf("tick: %v\n", t)
	}
}

func createStream(until int) <-chan time.Time {
	log.Print("createStream")

	t := time.NewTicker(1 * time.Second)

	i := 0
	for i < until {
		select {
		case <-t.C:
			i++
			return t.C
		}
	}

	return t.C
}
