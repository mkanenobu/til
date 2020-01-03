import strutils

type
  Person = ref object of RootObj
    name: string
    age: int
  # inherit Person
  Employee = ref object of Person
    id: int

# setter
proc `ageStr=`(person: var Person, age: string) {.inline.} = person.age = age.parseInt

var person = new Person
person.name = "John"
person.ageStr = "33"

var employee = new Employee
echo employee of Employee == true
echo employee of Person == true
