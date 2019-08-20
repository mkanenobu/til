// anonymous function
void main() {
  var list = ['apples', 'bananas', 'oranges'];
  list.forEach((item) {
    print('${list.indexOf(item)}: $item');
  });
  list.forEach((item) => print('${list.indexOf(item)}: $item'));
}
