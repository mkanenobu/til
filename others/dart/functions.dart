// Function
int timesTwo(int n) {
  return n * 2;
}

// Arrow function
int timesFour(int n) => timesTwo(timesTwo(n));

// Functions are objects
int runTwice(int x, Function f) {
  for (var i = 0; i < 2; i++) {
    x = f(x);
  }
  return x;
}

// type annotation can omit, but recommended for public APIs
isNobleGass(atomicNumber) {
  return _nobleGasses[atomicNumber] != null;
}

main() {
  print("4 times two is ${timesTwo(4)}");
  print("4 times four is ${timesFour(4)}");
  print("2 x 2 x 2 is ${runTwice(2, timesTwo)}");
}

var _nobleGasses = {
  2: 'helium',
  10: 'neon',
  18: 'argon',
  36: 'krypton',
  54: 'xenon',
  86: 'radon',
  118: 'oganesson',
};

