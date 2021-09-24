package main

import (
	"fmt"
	"time"
)

func timerCancel() {
	timer := time.NewTimer(time.Second)

	go func() {
		<-timer.C
		fmt.Println("Timer 2 fired")
	}()

	stop := timer.Stop()
	if stop {
		fmt.Println("Timer 2 stopped")
	}

	time.Sleep(2 * time.Second)

	// ↓ is deadlock error, time.Stop() is stops timer but not send timer.C event
	// <-timer.C
}

func main() {
	timer := time.NewTimer(2 * time.Second)

	// waiting for timer
	<-timer.C

	timerCancel()
}
