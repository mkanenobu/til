package parse

import (
	"bufio"
	"errors"
	"fmt"
	"log"
	"os"
	"regexp"
	"reverse-polish-calculator/stack"
	"strconv"
	"strings"
)

func ReadLine(s *stack.Stack) {
	scanner := bufio.NewScanner(os.Stdin)
	for scanner.Scan() {
		parseLine(scanner.Text(), s)
	}
	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}
}

func parseLine(str string, s *stack.Stack) {
	for _, v := range splitLine(str) {
		item, err := parseItem(v)
		if err != nil {
			log.Println(err)
		}

		if item.itemType == "int" {
			s.Put(item.value)
		} else if item.itemType == "operation" {
			switch item.operation {
			case "+":
				s.Add()
			case "-":
				s.Sub()
			case "*":
				s.Multi()
			case "/":
				s.Div()
			}
		}
	}

	stack.LogStack(s)
}

func splitLine(str string) []string {
	rep := regexp.MustCompile(`/ {2,}/`)
	return strings.Split(rep.ReplaceAllString(str, " "), " ")
}

type Item struct {
	value     int
	operation string
	itemType  string
}

func parseItem(str string) (*Item, error) {
	n, err := isNumeric(str)
	if err == nil {
		return &Item{value: n, itemType: "int"}, nil
	} else if isSymbol(str) {
		return &Item{operation: str, itemType: "operation"}, nil
	}
	return nil, errors.New(fmt.Sprintf("%v is not number or symbol", str))
}

func isSymbol(s string) bool {
	return s == "+" || s == "-" || s == "*" || s == "/"
}

func isNumeric(s string) (int, error) {
	return strconv.Atoi(s)
}
