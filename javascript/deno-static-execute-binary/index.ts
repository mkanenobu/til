import { process } from "https://deno.land/std@0.97.0/node/process.ts";
import { isPrimeNumber } from "./is-prime.ts";

if (process.argv.length < 3) {
  console.log("Missing argument.");
  console.log("example: ./out 13");
  process.exit(1);
}

const n = Number(process.argv[process.argv.length - 1]);

if (isNaN(n)) {
  console.log(`Input value (${n}) is not parsable.`);
  process.exit(2);
}

console.log(`${n} is ${isPrimeNumber(n) ? "prime number" : "not prime number"}.`);
