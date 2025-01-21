package main

import (
	"fmt"
	"github.com/mkanenobu/til/cache-with-expiration/cache"
	"runtime"
	_ "runtime/pprof"
	"time"
)

func main() {
	if err := runtime.StartTrace(); err != nil {
		panic(err)
	}

	c := cache.New[int](1 * time.Second)
	c.Set("one", 1, 1*time.Second)
	c.Set("two", 2, 5*time.Second)

	v, ok := c.Get("one")
	if ok {
		fmt.Printf("one: %d\n", *v)
	} else {
		fmt.Println("one: Not found")
	}

	time.Sleep(3 * time.Second)
	v, ok = c.Get("one")
	if ok {
		fmt.Printf("one: %d\n", *v)
	} else {
		fmt.Println("one: Not found")
	}

	v, ok = c.Get("two")
	if ok {
		fmt.Printf("two: %d\n", *v)
	} else {
		fmt.Println("two: Not found")
	}
}
