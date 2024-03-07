package main

import (
	"encoding/json"
	"fmt"
)

type JsonBody struct {
	Field     string `json:"field"`
	TestField struct {
	} `json:"test_field"`
}

func main() {
	json1 := `{ "field": "123", "test_field": null }`
	var jsonBody1 JsonBody
	err := json.Unmarshal([]byte(json1), &jsonBody1)
	if err != nil {
		fmt.Printf("json1 error: %s\n", err.Error())
	} else {
		fmt.Printf("%+v\n", jsonBody1)
	}

	json2 := `{ "field": "123" }`
	var jsonBody2 JsonBody
	err = json.Unmarshal([]byte(json2), &jsonBody2)
	if err != nil {
		fmt.Printf("json2 error: %s\n", err.Error())
	} else {
		fmt.Printf("%+v\n", jsonBody2)
	}

	// これはエラー
	json3 := `{ "field": "123", "test_field": "1" }`
	var jsonBody3 JsonBody
	err = json.Unmarshal([]byte(json3), &jsonBody3)
	if err != nil {
		fmt.Printf("json3 error: %s\n", err.Error())
	} else {
		fmt.Printf("%+v\n", jsonBody3)
	}
}
