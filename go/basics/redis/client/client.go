package client

import "github.com/go-redis/redis/v8"

func CreateClient() *redis.Client {
	return redis.NewClient(&redis.Options{
		Addr:     "localhost:8376",
		Password: "",
	})
}
