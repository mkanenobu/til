package main

import (
	"context"
	"fmt"
	"github.com/redis/rueidis"
)

func main() {
	client, err := rueidis.NewClient(rueidis.ClientOption{InitAddress: []string{"127.0.0.1:8376"}})
	if err != nil {
		panic(err)
	}
	defer client.Close()

	ctx := context.Background()

	// set
	err = client.Do(ctx, client.B().Set().Key(keyWithPrefix("Key")).Value("example val").Nx().Build()).Error()
	if err != nil {
		panic(err)
	}
	// get
	v, err := client.Do(ctx, client.B().Get().Key(keyWithPrefix("Key")).Build()).ToString()
	fmt.Printf("%s\n", v)
	if err != nil {
		panic(err)
	}
}

func keyWithPrefix(key string) string {
	return "rueidis_example:" + key
}
