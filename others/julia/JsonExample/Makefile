.PHONY: setup run

setup:
	julia --project=. --eval "using Pkg; Pkg.instantiate()"

run:
	@julia --project=. --eval "using JsonExample; JsonExample.main()"
