import { BloomFilter } from "../src/bloom-filter";

const data = ["test", "1", "2", "forge", "Thermal", "One hundred"];

for (let i = 5; i < 10000; i++) {
  data.push(`${i}th element`);
}

console.time("Naive");
data.forEach((e) => {
  data.find((d) => d === e);
});
data.forEach((e) => {
  // not found
  data.find((d) => `${d} hoge` === e);
});
console.timeEnd("Naive");

//
const filter = new BloomFilter();
data.forEach((e) => {
  filter.add(e);
});

console.time("Bloom Filter");
data.forEach((e) => {
  filter.has(e);
});
data.forEach((e) => {
  // not found
  filter.has(`${e} hoge`);
});
console.timeEnd("Bloom Filter");
