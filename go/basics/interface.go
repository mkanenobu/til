package main

import "fmt"

type Barker interface {
	Bark() (str string)
}

type Dog struct {
	Barker
	Name string
}

type Cat struct {
	Barker
	Name string
}

func (d Dog) Bark() string {
	b := d.Name + ": bowwow"
	fmt.Println(b)
	return b
}

func (c Cat) Bark() string {
	b := c.Name + ": miaou"
	fmt.Println(b)
	return b
}

func main() {
	dog := Dog{Name: "pochi"}
	dog.Bark()

	cat := Cat{Name: "tama"}
	cat.Bark()
}
