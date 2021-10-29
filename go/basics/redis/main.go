package main

import (
	"context"
	"fmt"
	"log"
	"redis/example/client"
)

var ctx = context.Background()

func main() {
	r := client.CreateClient()
	defer func() {
		err := r.Close()
		log.Fatal(err)
	}()

	err := r.Set(ctx, "k", "v", 0).Err()
	if err != nil {
		log.Fatal(err)
	}

	v := r.Get(ctx, "k").String()
	fmt.Println(v)

}
