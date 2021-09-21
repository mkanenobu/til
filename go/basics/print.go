package main

import "fmt"

/**
%v almost anything
%+v show struct field
%T show Go type

%t bool
%d int, uint
%g float, complex
%s string
%p chan, pointer
 */

type Example struct {
	key1 string
	key2 int
}

func main() {
	for _, v := range []string{"%v\n", "%+v\n", "%T\n"} {
		fmt.Println(v)
		fmt.Printf(v, true)
		fmt.Printf(v, 32)
		fmt.Printf(v, uint(32))
		fmt.Printf(v, 0.12345)
		fmt.Printf(v, 1-3i)
		fmt.Printf(v, make(chan bool))
		fmt.Printf(v, []int{1,2,3})
		fmt.Printf(v, map[string]int{"テスト": 1000})
		fmt.Printf(v, Example{key1: "value1", key2: 155})
	}
}

