package main

import (
  "fmt"
)

type S struct {
  // blank field is not affected to struct equality
  _ int
  v int
}

func main() {
  s1 := S{1, 10}
  s2 := S{2, 10}
  s3 := S{1, 5}

  fmt.Println(s1 == s2)
  fmt.Println(s1 == s3)
  fmt.Println(s2 == s3)
}
