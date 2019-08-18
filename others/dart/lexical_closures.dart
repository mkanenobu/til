// addBy を引数に取り、 i を引数に取る関数を返す関数
Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}

void main() {
  // create a function that adds 2
  var add2 = makeAdder(2);

  // create a function that adds 4
  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);
}
