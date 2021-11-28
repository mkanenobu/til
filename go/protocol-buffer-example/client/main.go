package main

import (
	pb "example.com/protocol-buffer-example/pb"
	"github.com/golang/protobuf/proto"
	"log"
	"net"
)

func createPersonData() pb.Person {
	return pb.Person{
		Id:    1234,
		Name:  "John Doe",
		Email: "jdoe@example.com",
		Phones: []*pb.Person_PhoneNumber{
			{Number: "555-4321", Type: pb.Person_HOME},
		},
	}
}

/**
Send marshaled data
 */
func main() {
	p := createPersonData()

	book := &pb.AddressBook{}
	book.People = append(book.People, &p)

	out, err := proto.Marshal(book)
	if err != nil {
		log.Fatal("Failed to marshal")
	}

	// create send client
	conn, err := net.Dial("tcp", "localhost:8080")
	if err != nil {
		panic(err)
	}

	// send
	_, err = conn.Write(out)
	if err != nil {
		panic(err)
	}
}
