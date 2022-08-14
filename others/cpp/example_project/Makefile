build:
	cmake -S . -B build && cmake --build build

run:
	./build/a.out

clean:
	rm -rf build

format:
	fd --regex '\.(h|cpp)' | xargs clang-format -i --style=Microsoft
