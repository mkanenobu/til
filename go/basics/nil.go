package main

import "fmt"

type St struct {
	NullableProperty *string
	Property         string
}

func isEmpty(s *string) bool {
	return s == nil || len(*s) == 0
}

func main() {
	s := St{}
	fmt.Printf("%#v\n", s.Property)                  // -> ""
	fmt.Printf("%#v\n", s.NullableProperty)          // -> nil
	fmt.Printf("%#v\n", isEmpty(s.NullableProperty)) // -> true
	// fmt.Printf("%#v\n", *s.NullableProperty) // --> invalid memory address or nil pointer dereference
}
