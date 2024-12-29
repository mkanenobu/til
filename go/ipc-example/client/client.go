package main

import (
	"github.com/mkanenobu/til/go/ipc-example/consts"
	"log"
	"net"
)

func main() {
	conn, err := net.DialUnix("unix", nil, &net.UnixAddr{Name: consts.SOCK_PATH, Net: "unix"})
	if err != nil {
		log.Fatalf("[CLIENT] %v", err)
	}
	defer conn.Close()

	n, err := conn.Write([]byte("hello"))
	log.Printf("[CLIENT] sent message: %d bytes", n)

	buf := make([]byte, 1024)
	n, err = conn.Read(buf)
	if err != nil {
		log.Fatalf("[CLIENT] failed to read: %v", err)
	}

	log.Printf("[CLIENT] received: %s", string(buf[:n]))
}
