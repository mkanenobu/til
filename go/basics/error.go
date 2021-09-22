package main

import (
	"errors"
	"log"
)

func createNewError() error {
	return errors.New("this is new error")
}
func main() {
	err := createNewError()
	log.Fatal(err)
}

