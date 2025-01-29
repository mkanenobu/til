package main

import (
	"fmt"
	"go/ast"
	"go/parser"
	"go/token"
	"io"
	"os"
)

func main() {
	source, err := readFile("./main.go")
	if err != nil {
		panic(err)
	}

	fset := token.NewFileSet()
	tree, err := parser.ParseFile(fset, "", string(source), parser.AllErrors)
	if err != nil {
		panic(err)
	}

	ast.Inspect(tree, func(n ast.Node) bool {
		// ASTを捜査してIdentノードのみをprint
		if ident, ok := n.(*ast.Ident); ok {
			fmt.Printf("%q, pos: %+v\n", ident.Name, ident.Pos())
		}
		return true
	})
}

func readFile(filepath string) ([]byte, error) {
	f, err := os.Open(filepath)
	if err != nil {
		return nil, err
	}
	defer f.Close()

	content, err := io.ReadAll(f)
	if err != nil {
		return nil, err
	}

	return content, nil
}
