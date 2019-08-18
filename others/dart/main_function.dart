// Every app have top-level main() function, which serves as the entry point to the app.
// main() function returns `void` and has optional List<String> parameter for argument

// ..構文はカスケードと呼ばれ、単一のオブジェクトのメンバーに対して複数の操作を実行出来る
// web application entry point
// void main() {
//   querySelector('#sample_text_id')
//       ..text = 'Click me!'
//       ..onClick.listen(reverseText);
// }

// execute `dart %s 1 test`
void main(List<String> arguments) {
  print(arguments);

  assert(arguments.length == 2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');
}
