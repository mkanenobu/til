.PHONY: setup run

setup:
	julia --project=. --eval "using Pkg; Pkg.instantiate()"

run:
	@julia --project=. --eval "using ModulingExample; ModulingExample.main()"
