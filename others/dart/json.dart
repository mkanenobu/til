import 'dart:convert';

var jsonString = '''
{
  "id": 1,
  "name": "Bob"
}
''';

main() {
  print(jsonDecode(jsonString)["name"]);
}
