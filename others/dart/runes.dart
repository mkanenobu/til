main() {
  // runes are UTF-32 code points of a string
  var heartChar = '\u2665';
  var smileEmoji = '\u{1f600}';
  print(heartChar);
  print(smileEmoji);
  print(smileEmoji.codeUnits);
  print(smileEmoji.runes.toList());

  Runes input = new Runes(
      '\u2665 \u{1f605} \u{1f60e} \u{1f47b} \u{1f596} \u{1f44d}');
  print(new String.fromCharCodes(input));
}
