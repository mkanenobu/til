main() {
  // set is unordered collection of unique items
  Set<String> halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  // create empty set
  var names = <String>{};
  // var names = {}; // create a map, not a set
  var _map = {}; // Map<dynamic, dynamic>

  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);
  assert(elements.length == 5);

  final constantSet = const {
    'fluorine',
    'chlorine',
    'bromine',
    'iodine',
    'astatine',
  };
  // constantSet.add('helium'); // Error

  // can use spread operator(... and ...?) and collection if, collection for
}
