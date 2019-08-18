
// optional parameters:
// オプショナル引数は `named` か `positional` だが両方ではない
// またオプショナル引数は必須(普通の)引数の前にこない

// Named parameters
void enableFlag({bool bold, bool hidden}) => bold && hidden;

// Positional parameters
String says(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

// optional with default value
String say(String from, String msg,
    [String device = 'carrier piegeion', String mood]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  if (mood != null) {
    result = '$result (in a $mood mood)';
  }
  return result;
}

// default value
void enableFlag2({bool bold = false, bool hidden = false}) => bold && hidden;

void main() {
  enableFlag(bold: true, hidden: false);
  assert(says('Bob', 'Howdy') == 'Bob says Howday');
  assert(says('Bob', 'Howdy', 'smoke signal') == 'Bob says Howday with a smoke signal');
  enableFlag2(bold: true);
  assert(say('Bob', 'Howdy') ==
      'Bob says Howdy with a carrier pigeon');
}
