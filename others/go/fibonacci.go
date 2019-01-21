package main

import "fmt"

func main() {
  fmt.Println(fibo(13))
}

func fibo(n int) int {
  if n == 0 {
    return 0
  }
  a := 0
  b := 1
  var c int

  for i := 0; i < n; i++ {
    c = a + b
    a = b
    b = c
  }
  return b
}
