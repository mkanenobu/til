package main

import (
	"errors"
	"fmt"
	"log"
	"math/rand"
	"time"
)

func randomValueIsOne() (bool, error) {
	var err error
	rand.Seed(time.Now().Unix())
	v := rand.Intn(5)
	result := v == 1

	if v != 1 {
		err = errors.New("V is not 1")
	}
	return result, err
}

func main() {
	result, err := randomValueIsOne()
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(result)
}