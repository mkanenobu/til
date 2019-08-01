interface Person {
  first_name: string
  last_name: string
  age: number
}

class John implements Person {
  first_name: "John"
  last_name: "Doe"
  age: 32
}

class Bob implements Person {
  first_name: "Bob"
  last_name: "James"
  age: 22
}

class Alice implements Person {
  first_name: "Alice"
  last_name: "Liddell"
  age: 25
}

const people: Person[] = [new John(), new Bob(), new Alice()]
