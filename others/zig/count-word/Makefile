.PHONY: run, build, test, format, clean

run:
	zig build run -- example.txt "dolor"

build:
	@zig build

test:
	@zig test src/main.zig

format:
	@zig fmt **/*.zig

clean:
	@rm -rf zig-cache zig-out
