package main

import (
	"context"
	"fmt"
	"time"
)

func main() {
	ctx := context.Background()
	cancelableCtx, cancel := context.WithCancel(ctx)

	defer cancel()

	done := make(chan struct{}, 1)
	go func() {
		task(cancelableCtx)
		done <- struct{}{}
	}()

	go func() {
		time.Sleep(5 * time.Second)
		cancel()
	}()

	<-done
}

func task(ctx context.Context) {
	for {
		select {
		case <-ctx.Done():
			return
		default:
			fmt.Printf("%s\n", time.Now())
			time.Sleep(1 * time.Second)
		}
	}
}
