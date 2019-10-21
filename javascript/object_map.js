const obj = {
  one: 1,
  two: 2,
  three: 3,
}

Object.entries(obj).map((el) => {
  const [key, val] = el;
  console.log(key);
  console.log(val);
})
