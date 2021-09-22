package main

import (
	"fmt"
	"time"
)

func done(msg chan string) {
	time.Sleep(time.Second * 1)
	msg <- "done"
}

func channelBuffering() {
	messages := make(chan string, 2)
	messages <- "buffered"
	messages <- "channel"

	fmt.Println(<-messages)
	fmt.Println(<-messages)
}

// pings: sender
func ping(pings chan<- string, msg string) {
	pings <- msg
}

// pings: sender, pongs: receiver
func pong(pings <-chan string, pongs chan<- string) {
	msg := <-pings
	pongs <- msg
}

func main() {
	messages := make(chan string)

	go done(messages)
	fmt.Println("progress")

	// waiting for receive
	msg := <-messages
	fmt.Println(msg)

	channelBuffering()

	pings := make(chan string, 1)
	pongs := make(chan string, 1)
	// message -> ping -> pong
	ping(pings, "passed message")
	pong(pings, pongs)
	fmt.Println(<-pongs)
}
