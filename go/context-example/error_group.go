package main

import (
	"context"
	"errors"
	"fmt"
	"golang.org/x/sync/errgroup"
	"time"
)

func HeavyTask(shouldReturnError bool) error {
	time.Sleep(2 * time.Second)
	if shouldReturnError {
		return errors.New("error")
	}
	return nil
}

func ErrorGroup() {
	// ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	// defer cancel()
	ctx := context.Background()

	eg, ctx := errgroup.WithContext(ctx)

	fnc := func(_ context.Context, id string) error {
		fmt.Printf("start: %v\n", id)
		time.Sleep(2 * time.Second)
		if id == "id3" {
			fmt.Printf("failed: %v\n", id)
			return errors.New("pien")
		}
		fmt.Printf("end: %v\n", id)
		return nil
	}
	for i, id := range []string{"id1", "id2", "id3", "id4", "id5"} {
		eg.Go(func() error {
			//fmt.Printf("start: %d\n", i)

			select {
			case <-ctx.Done():
				fmt.Println("ctx done")
				return ctx.Err()
			case <-time.After(time.Duration(i) * time.Second):
				return fnc(ctx, id)
			}
		})
	}
	if err := eg.Wait(); err != nil {
		fmt.Println(err)
	}
}
