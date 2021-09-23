package main

import (
	"fmt"
	"time"
)

func timerCancel() {
	timer2 := time.NewTimer(time.Second)
	go func() {
		<-timer2.C
		fmt.Println("Timer 2 fired")
	}()
	stop2 := timer2.Stop()
	if stop2 {
		fmt.Println("Timer 2 stopped")
	}

	time.Sleep(2 * time.Second)
}

func main() {
	timer := time.NewTimer(2 * time.Second)

	// waiting for timer
	<-timer.C

	timerCancel()
}
