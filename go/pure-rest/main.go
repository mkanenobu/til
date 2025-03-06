package main

import (
	"encoding/json"
	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"io"
	"net/http"
)

func main() {
	r := chi.NewRouter()
	r.Use(middleware.Logger)
	r.Get("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Hello, World!"))
	})
	r.Post("/", EchoBackHandler)
	http.ListenAndServe(":3000", r)
}

type HttpResponse[T any] struct {
	Status int
	Body   T
}

func HandlerAdapter[T any](f func(request *http.Request) (*HttpResponse[T], error)) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		res, err := f(r)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(res.Status)
		json.NewEncoder(w).Encode(res.Body)
	}
}

// Handler implementation

type EchoBackResponse struct {
	Echo string `json:"echo"`
}

func echoBackHandler(r *http.Request) (*HttpResponse[EchoBackResponse], error) {
	body, err := io.ReadAll(r.Body)
	if err != nil {
		return nil, err
	}

	return &HttpResponse[EchoBackResponse]{
		Status: http.StatusOK,
		Body: EchoBackResponse{
			Echo: string(body),
		},
	}, nil
}

var EchoBackHandler = HandlerAdapter[EchoBackResponse](echoBackHandler)
