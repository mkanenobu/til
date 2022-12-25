package docker

import (
	"context"
	"github.com/docker/docker/api/types"
	"log"
)

func Subscribe() {
	log.Println("Subscribing to Docker events...")
	cli := Client()

	ch, errCh := cli.Events(context.Background(), types.EventsOptions{})
	select {
	case err := <-errCh:
		if err != nil {
			panic(err)
		}
	case rec := <-ch:
		log.Printf("%+v\n", rec)
	}
}
