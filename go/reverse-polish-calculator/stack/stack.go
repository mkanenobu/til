package stack

import (
	"errors"
	"fmt"
	"log"
)

type StackOperator interface {
	Put()
	Pop()
	IsEmpty()
	Add()
	Sub()
	Multi()
	Div()
}

type Stack struct {
	StackOperator
	Data []int
	Size int
}

func CreateStack(cap int) *Stack {
	s := Stack{Data: make([]int, 0, cap), Size: 0}
	return &s
}

func (s *Stack) Put(n int) {
	s.Data = append(s.Data, n)
	s.Size++
}

func (s *Stack) Pop() (int, error) {
	if s.IsEmpty() {
		return 0, errors.New("stack is empty")
	}
	lastElm := s.Data[s.Size-1]
	s.Size--
	s.Data = s.Data[:s.Size]
	return lastElm, nil
}

func (s *Stack) IsEmpty() bool {
	return s.Size == 0
}

func (s *Stack) Add() {
	n := popTwoItems(s)
	if n == nil {
		return
	}
	s.Put(n.a + n.b)
}

func (s *Stack) Sub() {
	n := popTwoItems(s)
	if n == nil {
		return
	}
	s.Put(n.b - n.a)
}

func (s *Stack) Multi() {
	n := popTwoItems(s)
	if n == nil {
		return
	}
	s.Put(n.a * n.b)
}

func (s *Stack) Div() {
	n := popTwoItems(s)
	if n == nil {
		return
	}
	s.Put(n.b / n.a)
}

type TwoElms struct {
	a int
	b int
}

func popTwoItems(s *Stack) *TwoElms {
	a, err1 := s.Pop()
	b, err2 := s.Pop()

	if err1 != nil {
		log.Println(err1)
		return nil
	}
	if err2 != nil {
		log.Println(err2)
		return nil
	}

	return &TwoElms{a, b}
}

func LogStack(s *Stack) {
	fmt.Printf("stack data: %v, size: %v\n", s.Data, s.Size)
}

