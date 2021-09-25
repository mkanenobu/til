package main

import (
	"encoding/json"
	"log"
	"net/http"
)

type Message struct {
	Msg string `json:"msg"`
}

func root(w http.ResponseWriter, r *http.Request) {
	log.Println("hit /")
	j, err := json.Marshal(Message{
		Msg: "Hello, World!",
	})
	if err != nil {
		log.Fatal(err)
	}

	_, err = w.Write(j)
	if err != nil {
		log.Fatal(err)
	}
}

func handleRequests(errored chan bool) {
	http.HandleFunc("/", root)
	go func() {
		err := http.ListenAndServe(":8081", nil)
		if err != nil {
			errored <- true
			log.Fatal(err)
		}
	}()
	log.Println("Starting with http://localhost:8081")
}

func main() {
	err := make(chan bool)
	handleRequests(err)

	<-err
}
