package main

import (
  "fmt"
)

// varで変数宣言
var val int
var arr = []int{1,2,3}

func main() {
  for i:= 0; i < 10; i++ {
    fmt.Println(i)
  }

  // ':='を使用することで型推論する。(型宣言が必要ない)
  b := true
  if b {
    fmt.Println("true!")
  }
}
