const obj1 = {
  rootKey: {
    key1: 'value1',
    key2: 'value2',
  },
}

const obj2 = {
  ...obj1,
  rootKey: {
    ...obj1.rootKey,
    key3: 'value3',
  },
}

console.log(obj2)
