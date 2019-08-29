main() {
  // final キーワードは JS の const と同様に再代入はできないがオブジェクトの中身は可変
  final List<String> fruits = ['mangoes', 'bananas', 'pears', 'oranges'];
  // fruits = [...fruits, 'apples'];  // Error
  fruits.add('apples');
  // オブジェクトの中身も不変にしたい場合は const キーワードを使用する
  // ignore: unused_local_variable
  final List<String> constantFruits = const ['mangoes', 'bananas', 'peras', 'oranges'];
  // or (Same)
  const List<String> constantFruits2 = ['mangoes', 'bananas', 'peras', 'oranges'];
  // constantFruits.add('apples'); // Error
  print(fruits);


  // create n.length list (elements are null)
  var list = List(3);
  print(list); // [null, null, null]

  // create n.length list (elements filled second args)
  list = List.filled(2, "Hello", growable: true);
  print(list); // [Hello, Hello]

  // create n.length list with generater
  list = List.generate(5, (index) => index * 2, growable: true);
  print(list);
  var generater = (index) => index + 100;
  list = List.generate(5, generater, growable: true);
  print(list);

  // List.from(Iterable list, {bool growable})
  list = List.generate(5, (index) => "Hello ${index + 1}", growable: true);
  print(list);
  var list2 = List.from(list, growable: true);

  // List methods
  // add element
  fruits.add('peaches');
  // add elements
  fruits.addAll(['plums', 'melons']);
  // remove by element
  fruits.remove('peaches');
  // remove by index
  fruits.removeAt(1);
  // convert to Map
  print(fruits.asMap()); // Key: list index, Value: value
  // insert element with index
  fruits.insert(0, 'strawberries');
  print(fruits[0]);
  // insert elements with index
  fruits.insertAll(0, ['pineapples', 'grapes']);
  print(fruits[0]);

  // getRange return Iterable
  print(fruits.getRange(1, 3).toList());

  // fillRange
  fruits.fillRange(1, 5, 'pears');
  print(fruits);

  // lastIndexOf は同じ要素が複数ある場合、最後の要素のインデックスを返す
  print(fruits.lastIndexOf('pears'));
  // lastIndexWhere は lastIndexOf と同じ機能だが真偽値を返すコールバックを引数に取る
  print(fruits.lastIndexWhere((item) => item == 'pears'));

  // shuffle: 要素をシャッフルする、レシーバー自体を変更する
  fruits.shuffle();
  print(fruits);

  // sort: コールバックを取る
  fruits.sort((a, b) => a.compareTo(b));
  print(fruits);

  // any: コールバックの戻り値が全て false の場合のみ false, ruby の any と似た感じ
  print(fruits.any((fruit) => fruit.startsWith('a')));

  // every: コールバックの戻り値が全て true の場合のみ true
  print(fruits.every((fruit) => fruit is String));

  // expand: コールバックを全ての element に適用したものを Iterable として返す
  print(fruits.expand((fruit) => ["fst:$fruit", "snd:$fruit"]).toList());

  // reduce and fold
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  print(numbers.reduce((a, b) => a + b));
  print(numbers.fold(100, (number, acc) => acc + number));

  // join
  print(fruits.join(', '));

  // map: Iterable を返す、expand との違いは元のリストと違う長さ、型を生成できないところ
  print(fruits.map((fruit) => "$fruit is fruits").toList());

  // forEach
  fruits.forEach((fruit) {
    print(fruit);
  });
  // fruits.forEach((fruit) => print(fruit)); // Same

  // followedBy: 渡された List, Iterable を追加し、 Iterable を返す
  print(fruits.followedBy(['coconuts', 'guavas']).toList());

  // take: 先頭から n 個の要素を Iterable で返す
  print(fruits.take(3).toList());
}
