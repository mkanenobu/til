package main

import "fmt"

// User 構造体
type User struct {
	Id        string
	FirstName string `json:"firstName"`
	LastName  string `json:"lastName"`
}

// AdminUser 他の構造体を埋め込むことが出来る
type AdminUser struct {
	*User
	Email string
}

// UserInterface インターフェース
type UserInterface interface {
	GetFullName() string
}

// 空のインターフェース=何も実装する必要がない=全ての値がこのインターフェースの実装である=全ての値を受け付ける
type Any interface{}

func printAny(any Any) {
	fmt.Println(any)
}

// このメソッドによって User は UserInterface を満たす
func (s User) GetFullName() string {
	return fmt.Sprintf("%s %s", s.FirstName, s.LastName)
}

// PrintFullName 引数の型にインターフェースを指定、インターフェースを満たす実装のみを受け付ける
// 構造体がインターフェースを満たすか=構造体にインターフェースのメソッドが実装されているか
func PrintFullName(i UserInterface) {
	println(i.GetFullName())
}

func main() {
	u := User{Id: "1", FirstName: "Taro", LastName: "Yamada"}
	PrintFullName(u)

	// 変数の型にインターフェースを指定出来る
	var i UserInterface = User{}
	PrintFullName(i)

	// 埋め込まれた構造体は埋め込んだ構造体のメソッドを直接使える
	emb := AdminUser{User: &u, Email: "test@example.cim"}
	fmt.Printf("%v\n", emb.GetFullName())

	printAny(u)
}
