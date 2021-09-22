package main

import (
	"example.com/m/lib"
)

func main() {
	lib.PublicFunc()

	// ↓ not work
	// lib.thisIsPrivateFunc()
}
