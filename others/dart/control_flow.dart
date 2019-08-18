
isEven(int n) {
  // if-else statement
  if (n % 2 == 0) {
    return true;
  } else {
    return false;
  }
}

List<int> getEvenNumbers(Iterable<int> numbers) {
  var evenNumbers = <int>[];

  // for-in loop
  for (var i in numbers) {
    // single line if statement
    if (isEven(i)) evenNumbers.add(i);
  }
  return evenNumbers;
}

main() {
  var numbersList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  print(getEvenNumbers(numbersList));
  // conditional expression
  isEven(2) ? print('even') : print('odd');
}
