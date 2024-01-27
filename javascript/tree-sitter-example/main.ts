import Parser, { type SyntaxNode } from "tree-sitter";
// @ts-expect-error
import TypeScript from "tree-sitter-typescript";
import { readFileSync } from "node:fs";

const tsParser = new Parser();
tsParser.setLanguage(TypeScript.typescript);

const sourceCode = readFileSync("./example.ts", "utf-8");

const ast = tsParser.parse(sourceCode);

// ast.printDotGraph();

const getFunctionNodes = (node: SyntaxNode) => {
  const functionNodeTypes = ["arrow_function", "function_declaration"];

  const functions: Set<SyntaxNode> = new Set();

  const cursor = node.walk();

  const walk = (node: SyntaxNode) => {
    if (functionNodeTypes.includes(node.type)) {
      functions.add(node);
    }

    for (const child of node.children) {
      walk(child);
    }
  };

  do {
    const node = cursor.currentNode;

    walk(node);
  } while (cursor.gotoFirstChild() || cursor.gotoNextSibling());

  return functions;
};

const functions = getFunctionNodes(ast.rootNode);

console.log(functions.size);
functions.forEach((node) => {
  console.log(node.text);
});
