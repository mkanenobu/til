build-go:
	go build -o standard-go ./main.go
build-tinygo:
	tinygo build -o tiny ./main.go

bench-go:
	time ./standard-go
bench-tinygo:
	time ./tiny
