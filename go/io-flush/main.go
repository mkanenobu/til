package main

import (
	"bufio"
	"io"
	"os"
	"time"
)

func printIntervalByChar(str string, interval time.Duration) {
	writer := bufio.NewWriter(os.Stdout)
	for _, c := range str {
		time.Sleep(interval)
		io.WriteString(writer, string(c))
		writer.Flush()
	}
}

func main() {
	printIntervalByChar("Hello, World!\n", 100*time.Millisecond)
}
