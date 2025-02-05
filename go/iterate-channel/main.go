package main

import (
	"context"
	"log"
	"time"
)

func main() {
	ticker := time.NewTicker(1 * time.Second)
	ctx0 := context.Background()
	ctx1, cancel := context.WithCancel(ctx0)

	go func() {
		time.Sleep(5 * time.Second)
		cancel()
	}()

LOOP:
	for {
		select {
		case <-ctx1.Done():
			break LOOP
		case c := <-ticker.C:
			log.Printf("tick: %s\n", c)
		}
	}
}
