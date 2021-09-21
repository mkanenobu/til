package main

import (
	"database/sql"
	"fmt"
	_ "github.com/mattn/go-sqlite3"
	"log"
	"math/rand"
	"os"
)

const dbFilePath = "./example.db"

func openDb() *sql.DB {
	os.Remove(dbFilePath)

	db, err := sql.Open("sqlite3", dbFilePath)
	if err != nil {
		log.Fatal(err)
	}

	return db
}

func createRecords(tx *sql.Tx) *sql.Tx {
	stmt, err := tx.Prepare(`INSERT INTO users(id, name, age) VALUES(?, ?, ?)`)
	if err != nil {
		log.Fatal(err)
	}
	defer stmt.Close()

	for i := 0; i < 100; i++ {
		_, err = stmt.Exec(i, fmt.Sprintf("John No.%v", i), rand.Intn(100))
		if err != nil {
			log.Fatal(err)
		}
	}
	return tx
}

func main() {
	db := openDb()
	defer db.Close()

	createTableQuery := `
CREATE TABLE users (id INTEGER NOT NULL PRIMARY KEY, name TEXT, email TEXT, age INTEGER);
DELETE FROM users;
`
	_, err := db.Exec(createTableQuery)
	if err != nil {
		log.Printf("%q: %s\n", err, createTableQuery)
		return
	}

	tx, err := db.Begin()
	if err != nil {
		log.Fatal(err)
	}
	tx = createRecords(tx)
	tx.Commit()

	rows, err := db.Query("SELECT id, name, age from users")
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	for rows.Next() {
		var id int
		var name string
		var age int
		err = rows.Scan(&id, &name, &age)
		if err != nil {
			log.Fatal(err)
		}
		fmt.Printf("%+v\n", struct {
			Id   int
			Name string
			Age  int
		}{id, name, age})
	}
}
