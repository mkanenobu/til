
const raiseError = () => {
  throw "hoge"
}

const a = raiseError() || 'aaa'
console.log(a)
