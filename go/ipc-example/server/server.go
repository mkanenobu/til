package main

import (
	"errors"
	"github.com/mkanenobu/til/go/ipc-example/consts"
	"io"
	"log"
	"net"
	"os"
)

// echo server
func main() {
	if _, err := os.Stat(consts.SOCK_PATH); err == nil {
		_ = os.Remove(consts.SOCK_PATH)
	}

	listener, err := net.ListenUnix("unix", &net.UnixAddr{consts.SOCK_PATH, "unix"})
	if err != nil {
		log.Fatalf("[SERVER] %v", err)
	}
	defer listener.Close()
	log.Printf("[SERVER] started")

	for {
		conn, err := listener.AcceptUnix()
		if err != nil {
			log.Printf("[SERVER] failed to accept: %v", err)
		}

		go handleConnection(conn)
	}
}

func handleConnection(conn *net.UnixConn) {
	defer conn.Close()

	buf := make([]byte, 1024)
	for {
		n, err := conn.Read(buf)
		if errors.Is(err, io.EOF) {
			return
		}
		if err != nil {
			log.Printf("[SERVER] failed to read: %v", err)
			return
		}

		log.Printf("[SERVER]: received: %s", string(buf[:n]))

		_, err = conn.Write(buf[:n])
		if err != nil {
			log.Printf("[SERVER]: failed to write: %v", err)
			return
		}
	}
}
