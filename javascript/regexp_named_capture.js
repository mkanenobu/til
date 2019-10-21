#!/usr/bin/env node

// const pattern = /(key=(?<key>.*?)\n|)payload=(?<payload>.*?)(&|$)/
const pattern2 = /(key=(.*?)\n|)payload=(.*?)(&|$)/
const pattern3 = /(key=(.*?)&|)payload=(.*?)(&|$)(key=(.*?)(&|$)|)/
const old_qr = 'https://yadoc/api/v3/personal/qr_connects?payload=xxx'
const new_qr = `key=KEY&payload=PAYLOAD`
const new_qr2 = `payload=PAYLOAD&key=KEY`


// console.log(old_qr.match(pattern))
// console.log(new_qr.match(pattern))

// console.log(old_qr.match(pattern2))
console.log(new_qr.match(pattern3))
console.log(new_qr2.match(pattern3))
