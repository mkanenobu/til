@JS('console')
library main;

import 'package:js/js.dart';
import 'dart:html';

external void log(dynamic str);

main() {
  log('Hello, World!');
  var message = DivElement()..text = 'Hello, World!';
  document.body.append(message);
  document.body.appendHtml('<div>Hogehoge</div>');
}
