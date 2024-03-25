package main

import (
	"context"
	"fmt"
	"time"
)

func DoneExample() {
	ctx, cancel := context.WithCancel(context.Background())
	gen := generator(ctx, 1)

	// 3回ループしたらキャンセルする
	for i := 0; i < 3; i++ {
		fmt.Println(<-gen)
	}

	cancel()

	time.Sleep(50 * time.Millisecond)
}

// generator コンテキストがキャンセルされるまで値を返し続ける
func generator(ctx context.Context, num int) <-chan int {
	out := make(chan int)

	go func() {
	Loop:
		for {
			select {
			case <-ctx.Done():
				break Loop
			case out <- num:
			}
		}

		close(out)
		fmt.Println("generator closed")
	}()

	return out
}
