PROJECT_NAME := CsvExample

.DEFAULT_GOAL := all

.PHONY: all setup run fmt

all: setup build

setup:
	julia --project=. pkg.jl

run:
	@julia --project=. --eval "using $(PROJECT_NAME); $(PROJECT_NAME).main()"

fmt:
	@julia --project=. --eval 'using JuliaFormatter; JuliaFormatter.format(".", verbose=true)'

