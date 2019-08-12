package main

import (
  "fmt"
)

func main() {
  i, s := f1()
  fmt.Printf("%d, %s\n", i, s)
  i, s = f2()
  fmt.Printf("%d, %s\n", i, s)
}

func f1() (int, string) {
  return 1, "function 1"
}

func f2() (i int, s string) {
  i = 2
  s = "function 2"
  return i, s
}

