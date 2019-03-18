package main
import "fmt"

func main() {
  arr := [3]string{"one", "two", "three"}
  for i, s := range arr {
    fmt.Printf("Index: %d, element: %s\n", i, s)
  }
}
