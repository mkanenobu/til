package main

import (
	"bytes"
	pb "example.com/protocol-buffer-example/pb"
	"fmt"
	"github.com/golang/protobuf/jsonpb"
	"github.com/golang/protobuf/proto"
	"io"
	"log"
	"net"
)

func createListener() net.Listener {
	l, err := net.Listen("tcp", ":8080")

	if err != nil {
		panic(err)
	}

	return l
}

func receiveData(conn net.Conn) []byte {
	var buf bytes.Buffer
	_, err := io.Copy(&buf, conn)
	if err != nil {
		log.Fatal(err)
	}

	return buf.Bytes()
}

func unmarshalData(data []byte) string {
	log.Println(fmt.Sprintf("Raw: %d", len(data)))
	book := &pb.AddressBook{}
	if err := proto.Unmarshal(data, book); err != nil {
		log.Fatalln("Failed to parse address book:", err)
	}

	addressBookMarshaller := jsonpb.Marshaler{}
	s, _ := addressBookMarshaller.MarshalToString(book)

	log.Println(fmt.Sprintf("Unmarshal: %d", len(s)))
	return s
}

/**
Start receiver server
 */
func main() {
	l := createListener()

	for {
		conn, err := l.Accept()
		if err != nil {
			panic(err)
		}

		go func() {
			d := receiveData(conn)
			s := unmarshalData(d)
			log.Println(s)
		}()
	}
}

