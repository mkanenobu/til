#!/usr/bin/env node

const f = (arg1, ...args) => {
  console.log(arg1)
  console.log(args)
}

f(1,2,3,4,5)
