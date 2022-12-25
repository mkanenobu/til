package main

import (
	"log"
	"time"
)

func closeAfterTimeout(ch chan bool, timeout time.Duration) {
	time.Sleep(timeout)
	close(ch)
}

func main() {
	ch := make(chan bool)

	log.Println("start")

	go closeAfterTimeout(ch, 5*time.Second)

	go (func(ch <-chan bool) {
		log.Println("start goroutine")
		// チャネルが閉じられるまでループする
		for i := 0; ; i++ {
			select {
			case <-ch:
				break
			default:
				log.Printf("in loop, i=%d\n", i)
			}
			time.Sleep(1 * time.Second)
		}
	})(ch)

	<-ch
	log.Println("end")
}
