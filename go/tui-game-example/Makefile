.PHONY: build run clean test fmt

build:
	go build -o tui-game-example .

run: build
	./tui-game-example

clean:
	rm -f tui-game-example

test:
	go test ./...

fmt:
	go fmt ./...