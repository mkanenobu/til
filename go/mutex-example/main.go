package main

import (
	"fmt"
	"sync"
)

var (
	count = 0
	mutex sync.Mutex
)

func main() {
	var wg sync.WaitGroup

	for i := 0; i < 5; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			mutex.Lock()
			defer mutex.Unlock()
			count += 1
			fmt.Printf("Incrementing: %d\n", count)
		}()
	}

	for i := 0; i < 5; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			mutex.Lock()
			defer mutex.Unlock()
			count -= 1
			fmt.Printf("Decrementing: %d\n", count)
		}()
	}

	wg.Wait()
	fmt.Println("Final Count:", count)
}
