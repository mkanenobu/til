package main

import (
	"fmt"
	"time"
)

type User struct {
	name string
	email string
	age int
}

func getUserBirthYear(user User) int {
	return time.Now().Year() - user.age
}

func printUserInfo(user User) {
	fmt.Printf("%v is %v old, and their email address is %v\n", user.name, user.age, user.email)
}

func main() {
	user := User{name: "John", email: "john@example.com", age: 25}
	fmt.Println(getUserBirthYear(user))
	printUserInfo(user)
}