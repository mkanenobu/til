// list literal
var lostNumbers = [4, 8, 15, 16, 32, 42];

// map literal
var nobleGasses = {
  'He': 'Helium',
  'Ne': 'Neon',
  'Ar': 'Argon',
};

// set literal
var frogs = {
  'Tree',
  'Poison dart',
  'Glass',
};

main() {
  print(lostNumbers.last);
  print(nobleGasses['Ne']);
  print(frogs.difference({'Poison dart'}));
}
