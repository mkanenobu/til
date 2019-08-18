main() {
  // dart does not allow `if (nonBooleanValue)` or `assert(nonBooleanValue)`

  // check for empty string
  var fullName = '';
  assert(fullName.isEmpty);

  // check for zero
  var hitPoints = 0;
  assert(hitPoints <= 0);

  // check for null
  var unicorn;
  assert(unicorn == null);

  // check for NaN
  var devidedByZero = 0 / 0; // not Exception
  assert(devidedByZero.isNan);
}
