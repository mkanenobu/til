type Literal = "sample1" | "sample2" | null

function sample(n: number): Literal {
  if (n === 1) {
    return "sample1"
  } else if (n === 2) {
    return "sample2"
  } else {
    return null
  }
}

console.log(sample(1))
console.log(sample(2))
console.log(sample(3))
