package main

import (
	"log"
	"os"
)

const filepath = "./sample.txt1"

func withOs() {
	// open file with write mode
	file, err := os.OpenFile(filepath, os.O_WRONLY, os.ModePerm)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	_, err = file.Write([]byte("Hello"))
	if err != nil {
		log.Fatal(err)
	}
}

func main() {
	withOs()
}
