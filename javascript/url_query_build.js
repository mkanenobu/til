
const queryArray = Object.keys(obj).map(key =>
  `${encodeURIComponent(key)}=${encodeURIComponent(obj[key])}`,
);
console.log(queryArray.join('&'))
