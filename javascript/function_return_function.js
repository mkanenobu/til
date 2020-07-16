const hello = () => {
  console.log("Hello, World!");
}

const f = () => {
  return hello;
}

f()()
