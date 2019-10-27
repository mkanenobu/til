const str = 'https://localhost:5000/home?user_id=1&come_first=0'
const str2 = 'https://example.com/home?user_id=1&come_first=0'

const params = {
  user_id: 1,
  come_first: 0,
}

const p = str.replace(/:(\w+)/g, (_, key) => {
  console.log(1, key)
  if (!!key) return key
})

console.log(p)
