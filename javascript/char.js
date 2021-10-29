const strings = [
  "s",
  "日本語",
  // emoji
  "👍",
  "🤔🤭",
  // surrogate pair
  "𠆢",
  "𠀋𠘨",
]

for (const s of strings) {
  console.log(s);

  const len = s.length;
  console.log("length: ", len);

  for (let i = 0; i < len; i++) {
    console.log("charAt: ", i, s.charAt(i))
  }
  console.log();
}
