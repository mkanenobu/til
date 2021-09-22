package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

type Message struct {
	Msg string `json:"msg"`
}

func root(w http.ResponseWriter, r *http.Request){
	log.Println("hit /")
	j, err := json.Marshal(Message{
		Msg: "Hello, World!",
	})
	if err != nil {
		log.Fatal(err)
	}

	_, err = fmt.Fprintf(w, string(j))
	if err != nil {
		log.Fatal(err)
	}
}

func handleRequests() {
	http.HandleFunc("/", root)
	err := http.ListenAndServe(":8081", nil)
	if err != nil {
		log.Fatal(err)
	}

}

func main() {
	handleRequests()
}
