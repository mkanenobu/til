main() {
  // Map has type Map<Key type, Value type>

  // gifts has type Map<String, String>
  var gifts = {
    // key: value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings',
  };
  Map<int, String> nobleGasses = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  // create empty map
  var gifts2 = Map();
  gifts2['first'] = 'partridge';
  gifts2['second'] = 'turtledoves';
  gifts2['fifth'] = 'golden rings';

  var nobleGasses2 = Map();
  nobleGasses2[2] = 'helium';
  nobleGasses2[10] = 'neon';
  nobleGasses2[18] = 'argon';
  assert(nobleGasses2.length == 3);
  // return null if key is not exits
  assert(nobleGasses2[26] == null);

  // create constant map
  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };
  // constantMap[2] = 'Helium'; // Error

  // can use spread operator(... and ...?) and collection if and collection for
  var allNobleGasses = {
    36: 'krypton',
    54: 'xenon',
    86: 'radon',
    118: 'oganesson',
    ...nobleGasses,
  };
  print(allNobleGasses);
}
