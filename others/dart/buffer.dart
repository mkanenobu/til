main() {
  String s = "String is imutable";
  StringBuffer sb = StringBuffer("String buffer is mutable");
  sb.write('hogehoge');
  print(sb);
}
