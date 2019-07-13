#!/usr/bin/env node

const s = 'aaa'

switch (s) {
  // not work
  // case 'aaa', 'string':
  case 'string':
  case 'aaa':
    console.log(s)
    break
  default:
    console.log('not match')
}
