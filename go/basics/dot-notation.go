package main

import (
	"log"
)

func logging(str ...string) {
	if str == nil {
		log.Println("blank")
		return
	}
	log.Println("first:", str[0])
	log.Println(str)
}

func main() {
	logging("123", "456")
	logging([]string{"123", "456"}...)
	logging()
}
