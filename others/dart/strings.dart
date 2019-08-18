main() {
  // UTF-16 code units
  print('a single quote string');
  print("a double quote string");

  // string concat operator
  print('cat' + 'dog');

  // triple quotes define multi-line string
  print('''triple qupted strings
are for multi lines''');

  // string interpolation
  var pi = 3.14;
  print('pi is $pi');
  print('tau is ${2 * pi}');

  // string interpolation
  var s = 'string interpolation';
  assert('Dart has $s, which is very handy.' ==
      'Dart has string interpolation, ' +
      'which is very handy.');
  assert('That deserves all caps. ' +
      '${s.toUpperCase()} is very handy!' ==
      'That deserves all caps. ' +
      'STRING INTERPOLATION is very handy!');

  // string concat
  var s1 = 'String '
      'concatenation'
      " works even over line breaks.";
  assert(s1 ==
      'String concatenation works even over '
      'line breaks.');
  var s2 = 'The + oprator ' + 'works, as well.';
  assert(s2 == 'The + operator works, as well.');

  // multi-line string
  s1 = '''
You can create
multi-line strings like this one.
''';
  s2 = """This is also a
multi-line string.""";

  // raw string
  s = r'In a raw string, not even \n gets special treatment.';
  print(s);
}
