main() {
  // simple list
  // list has type List<type>
  List<int> list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);

  list[1] = 1;
  assert(list[1] == 1);

  // create compile-time constant list
  var constantList = const [1, 2, 3];
  // constantList[1] = 1; // Error

  // spread operator(...) and null-aware spread operator(...?)
  var list1 = [1, 2, 3];
  var list2 = [0, ...list1];
  assert(list2 == [0, 1, 2, 3]);

  var list3;
  var list4 = [0, ...?list3];
  assert(list4.length == 1);

  // collection if
  var promoActive = false;
  var nav = [
    'Home',
    'Furniture',
    'Plants',
    if (promoActive) 'Outlet',
  ];
  assert(nav == ['Home', 'Furniture', 'Plants']);

  // collection for
  var listOfInts = [1, 2, 3];
  var listOfStr = [
    '#0',
    for (var i in listOfInts) '#$i'
  ];
  assert(listOfStr[1] == '#1');
}
