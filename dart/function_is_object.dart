void printInt(int element) {
  print(element);
}

// arrow function
var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';

main() {
  var list = [1, 2, 3];
  list.forEach(printInt);
  assert(loudify('hello') == '!!! HELLO !!!');
}
