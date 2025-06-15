.PHONY: build run test clean fmt

build:
	zig build

run:
	zig build run

test:
	zig build test

clean:
	rm -rf zig-out zig-cache

fmt:
	zig fmt $$(find . -name "*.zig")

help:
	@echo "Available targets:"
	@echo "  build - Build the application"
	@echo "  run   - Run the application"
	@echo "  test  - Run tests"
	@echo "  clean - Clean build artifacts"
	@echo "  fmt   - Format codes"
	@echo "  help  - Show this help message"
