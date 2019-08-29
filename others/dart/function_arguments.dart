// third argument has default value and named
int f(int a, int b, {int c = 0}) {
  return a + b + c;
}

main() {
  print(f(1, 2));
  print(f(1, 2, c: 3));
}
