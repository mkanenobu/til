let l = [9,8,7,6,5,4,3,2,1,0]

console.log("simple for")
for (let i = 0; i < l.length; i++) {
  console.log(l[i])
}

console.log("for in")
for (let i in l) {
  console.log(l[i])
}

console.log("for of")
for (let i of l) {
  console.log(i)
}

console.log("forEach")
l.forEach(e => console.log(e))

