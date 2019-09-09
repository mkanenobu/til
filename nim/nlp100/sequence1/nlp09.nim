import sequtils, strutils, strformat, random

proc take(s: var string, n: int): char =
  let length = s.len
  if n < 0:
    result = s[^(n.abs)]
    s.delete(length - n, length - n)
  else:
    result = s[n]
    s.delete(n, n)

proc radomize_word(s: string): string =
  var res = toSeq(s.items)
  res.shuffle
  return res.join("")

proc typoglycemia(s: string): string =
  randomize()
  var res: seq[string]
  for word in s.split:
    if word.len <= 4:
      res.add(word)
    else:
      var
        w = word
        first_char = w.take(0)
        last_char = w.take(-1)
        randomized = radomize_word(w)
      res.add(fmt"{first_char}{randomized}{last_char}")
  return res.join(" ")


let s = "I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."

echo s.typoglycemia
