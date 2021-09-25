package main

import (
	"fmt"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/s3"
	"log"
	"os"
)

func setRegion(reg ...string) {
	region := "ap-northeast-1"
	if reg != nil {
		region = reg[0]
	}
	err := os.Setenv("AWS_REGION", region)
	if err != nil {
		log.Fatal(err)
	}
}

func createSession() *session.Session {
	return session.Must(session.NewSession())
}

func listS3Buckets(session *session.Session) []*s3.Bucket {
	service := s3.New(session)
	res, err := service.ListBuckets(nil)
	if err != nil {
		log.Fatal(err)
	}
	return res.Buckets
}

func main() {
	setRegion()
	sess := createSession()

	fmt.Println(listS3Buckets(sess))
}
