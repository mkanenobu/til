package main

import (
	"encoding/json"
	"fmt"
	"log"
	"time"
)

type User struct {
	Name  string `json:"name"` // <- tag
	Email string `json:"email"`
	Age   int    `json:"age"`
}

func getUserBirthYear(user User) int {
	return time.Now().Year() - user.Age
}

func printUserInfo(user User) {
	fmt.Printf("%v is %v old, and their email address is %v\n", user.Name, user.Age, user.Email)
}

func toJsonString(user User) string {
	jsonBytes, err := json.Marshal(user)
	if err != nil {
		log.Fatal(err)
	}
	return string(jsonBytes)
}

func main() {
	user := User{Name: "John", Email: "john@example.com", Age: 25}
	fmt.Println(getUserBirthYear(user))
	printUserInfo(user)

	fmt.Println(toJsonString(user))

	// initialize with default value by type
	emptyUser := User{}
	printUserInfo(emptyUser)
}
