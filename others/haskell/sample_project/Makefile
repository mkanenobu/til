.PHONY: all run build fmt

run:
	cabal run

build:
	cabal build

# Install fourmolu with `cabal install fourmolu`
fmt:
	find . -name "*.hs" | xargs fourmolu -i
