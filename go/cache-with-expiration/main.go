package main

import (
	"fmt"
	"github.com/mkanenobu/til/cache-with-expiration/cache"
	"time"
)

func main() {
	c := cache.New[int](5 * time.Second)
	c.Set("one", 1, 1*time.Second)
	c.Set("two", 2, 1*time.Second)

	v, ok := c.Get("one")
	if ok {
		fmt.Printf("%+v\n", *v)
	} else {
		fmt.Println("Not found")
	}

	time.Sleep(2 * time.Second)
	v, ok = c.Get("one")
	if ok {
		fmt.Printf("%+v\n", *v)
	} else {
		fmt.Println("Not found")
	}
}
