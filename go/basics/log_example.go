package main

import "log"

func main() {
	// log.Fatal includes os.Exit(1)
	log.Fatal("aaa")

	// unreachable
	log.Println("Hello, World!")
}
