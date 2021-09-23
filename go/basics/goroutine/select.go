package main

import (
	"fmt"
	"time"
)

func selectReceive() {
	c1 := make(chan string)
	c2 := make(chan string)
	c3 := make(chan string)

	go func() {
		time.Sleep(1 * time.Second)
		c1 <- "one"
		c3 <- "three"
	}()
	go func() {
		time.Sleep(2 * time.Second)
		c2 <- "two"
	}()

	for i := 0; i < 3; i++ {
		// default がない場合はいずれかの準備が出来るまでブロックされる
		// (loop -> wait ->  c1 or c3 received) * 2 -> loop3 -> wait -> c2 received
		select {
		case msg1 := <-c1:
			fmt.Println("received", msg1)
		case msg2 := <-c2:
			fmt.Println("received", msg2)
		case msg3 := <-c3:
			// 複数のcaseが実行可能な場合はどれが実行されるかは保証されない
			fmt.Println("received", msg3)
		}
	}
}

func selectSend() {

}

func main() {
	selectReceive()
}
