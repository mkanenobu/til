main() {
  // Numbers (`num`)
  // dart の Numbers は int と double の二つの subtype を持つ
  // int: プラットフォームに応じた64bit以下の整数値
  //   - DartVMの場合: -2 ^ 63 ~ 2 ^ 63 - 1
  //   - JavaScriptにコンパイルする場合: -2 ^ 53 ~ 2 ^ 53 - 1
  // double: IEEE754準拠の倍精度浮動小数点
  var x = 1;
  var hex = 0xDEADBEEF;
  var f = 1.23;
  var exponent = 1.43e5;
  double z = 1; // equivalent to double z = 1.0

  // bit shift
  assert((3 << 1) == 6); // 0011 << 1 == 0110
  assert((3 >> 1) == 1); // 0011 >> 1 == 0001
  assert((3 | 4) == 7);  // 0011 | 0100 == 0111
  assert((3 & 4) == 0);  // 0011 & 0100 == 0000
}
