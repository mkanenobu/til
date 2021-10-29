package main

import (
	"errors"
)

type OptionalStringOperator interface {
	IsOk() bool
	UnwrapForce() string
}

type OptionalString struct {
	Value string
	Err error
}

func CreateOptionalString(v *string) OptionalString {
	if v == nil {
		return OptionalString{Err: errors.New("value is nil")}
	}
	return OptionalString{Value: *v}
}

func (o OptionalString) IsOk() bool {
	return o.Err == nil
}

func (o OptionalString) UnwrapForce() string {
	if o.IsOk() {
		return o.Value
	}
	panic("Value is not exists")
}

func main() {

}
