package main

import (
	"fmt"
	"time"
)

func catchTickerEvents(ticker *time.Ticker, done chan bool) {
	for {
		select {
		case <-done:
			return
		case t := <-ticker.C:
			fmt.Println("Tick at", t)
		}
	}
}

func main() {
	// ticker event fire every 500ms
	ticker := time.NewTicker(500 * time.Millisecond)
	done := make(chan bool)

	go catchTickerEvents(ticker, done)

	time.Sleep(1600 * time.Millisecond)
	ticker.Stop()
	done <- true
	fmt.Println("Ticker stopped")
}
