class Person {
  final String firstName, lastName;
  const Person(this.firstName, this.lastName);
  String fullName() => this.firstName + this.lastName;
}

main() {
  num integer = 10.1;
  var john = Person('John', 'Doe');
  // subtype にキャストする
  print(integer as double);
  assert(john is Person);
  assert(john is! String);
}
