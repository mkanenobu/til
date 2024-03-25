package main

import (
	"context"
	"fmt"
	"time"
)

func CancelPropagationExample() {
	Serial()
	Parallel()
}

func Serial() {
	ctx0 := context.Background()

	ctx1, _ := context.WithCancel(ctx0)
	// task1
	go func(ctx1 context.Context) {
		ctx2, cancel2 := context.WithCancel(ctx1)

		// task2-1
		go func(ctx2 context.Context) {
			// task2-2
			go func(ctx2 context.Context) {
				select {
				case <-ctx2.Done():
					fmt.Println("task2-2 canceled")
				}
			}(ctx2)

			select {
			case <-ctx2.Done():
				fmt.Println("task2-1 canceled")
			}
		}(ctx2)

		cancel2()

		select {
		case <-ctx1.Done():
			fmt.Println("task1 canceled")
		}

	}(ctx1)

	time.Sleep(time.Second)
}

func Parallel() {
	ctx0 := context.Background()

	ctx1, cancel1 := context.WithCancel(ctx0)
	// task1
	go func(ctx1 context.Context) {
		select {
		case <-ctx1.Done():
			fmt.Println("task1 canceled")
		}
	}(ctx1)

	// task2
	go func(ctx1 context.Context) {
		select {
		case <-ctx1.Done():
			fmt.Println("task2 canceled")
		}
	}(ctx1)

	cancel1()

	time.Sleep(time.Second)

}
