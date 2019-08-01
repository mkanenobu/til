import strformat

type
  Person = ref object of RootObj
    first_name: string
    last_name: string
    age: int

proc personalInfo(person: Person): string =
  return &"{person.first_name} {person.last_name} is {person.age} years old."

var bob: Person = Person(first_name: "Bob", last_name: "James", age: 30)

echo personalInfo(bob)

# Initialize
var alice: Person = new Person
alice.first_name = "Alice"
alice.last_name = "Liddell"
alice.age = 26
echo personalInfo(alice)

# reference copy (Personal type has "ref object")
var alice2 = alice
echo personalInfo(alice2)
alice.age = 40
echo personalInfo(alice2)

