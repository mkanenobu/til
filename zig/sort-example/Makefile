.PHONY: run
run:
	@zig build run

.PHONY: build
build:
	@zig build

.PHONY: test
test:
	@zig test src/main.zig 2>&1 | cat
	@zig test src/root.zig 2>&1 | cat

.PHONY: fmt
fmt:
	@zig fmt $$(find . -name "*.zig")

.PHONY: clean
clean:
	@rm -rf .zig-cache zig-out

