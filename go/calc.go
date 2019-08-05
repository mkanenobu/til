package main

import "fmt"

var a int = 10
var b int = 20

func main() {
  c := 0x10 // 16進数定義
  fmt.Println(c)
  fmt.Println(a + b)
  fmt.Println(a - b)
  fmt.Println(a / b)
  fmt.Println(a * b)
  fmt.Println(a % b) // 余剰
}
