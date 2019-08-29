class Person {
  String firstName;
  String lastName;
  int age;

  Person({String firstName, String lastName, int age}) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.age = age;
  }

  // getter
  String get fullName => this.firstName + ' ' + this.lastName;
}

// same as

class Person2 {
  final String firstName;
  final String lastName;
  final int age;
  // Named arguments
  Person2({this.firstName, this.lastName, this.age});

  // getter
  String get fullName => this.firstName + ' ' + this.lastName;
}

// Factory constructor
class Book {
  final String name;
  final int pageNum;
  Book(this.name, this.pageNum);

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(json['name'], json['pageNum']);
  }
}

// initialize
var john = Person2(firstName: 'John', lastName: 'Doe', age: 32);

// inherit
class Alice extends Person {
  Alice(int age): super(firstName: 'Alice', lastName: 'Liddell', age: age);
  Alice.alice(): this(24);
}

var secondAlice = Alice(54);

main() {
  print(john.lastName);
  print(Alice(19).firstName);
  print(secondAlice.age);
  // klass `Alice` has `fullName` getter because `Alice` exnteds `Person`
  print(secondAlice.fullName);
}
