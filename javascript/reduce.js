const arr = [1,2,3]

const reducer_sum = (acc, cur) => acc + cur

// Array.reduce(reducer: callback(acc, cur, index, org_array), initial_value)

console.log(arr.reduce(reducer_sum))
console.log(arr.reduce(reducer_sum, 10))
