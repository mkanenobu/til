package lib

import "fmt"

func thisIsPrivateFunc() {
	fmt.Println("private")
}

func PublicFunc() {
	fmt.Println("Hello, World!")
}

