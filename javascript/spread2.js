
const person = {
  id: 1,
  name: 'John',
  age: 33,
}

// 重複したフィールドは後勝ち
const person_dup1 = {
  ...person,
  name: 'Bob',
}

const person_dup2 = {
  name: 'Bob',
  ...person,
}

console.log(person_dup1)
console.log(person_dup2)
