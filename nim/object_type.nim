import strformat

type
  Person = ref object of RootObj
    name: string
    age: int

proc personalInfo(person: Person): string =
  return &"{person.name} is {person.age} years old."

var bob: Person = Person(name: "Bob", age: 30)

echo personalInfo(bob)

# Initialize
var alice: Person = new Person
alice.name = "Alice"
alice.age = 26
echo personalInfo(alice)

# reference copy (Personal type has "ref object")
var alice2 = alice
echo personalInfo(alice2)
alice.age = 40
echo personalInfo(alice2)

