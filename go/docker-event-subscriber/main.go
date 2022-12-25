package main

import "github.com/docker-event-subscriber/lib/docker"

func main() {
	for {
		docker.Subscribe()
	}
}
