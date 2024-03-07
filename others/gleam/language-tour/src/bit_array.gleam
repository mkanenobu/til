import gleam/io

pub fn bit_array() {
  // BitArrayはバイナリデータを利用するための構文
  // 様々なオプションを渡すことが出来る
  // ref: https://tour.gleam.run/data-types/bit-arrays/

  // 8 bit int. In binary: 00000011
  io.debug(<<3>>)
  io.debug(<<3>> == <<3:size(8)>>)
  // True
  io.debug(<<3>> == <<3:size(16)>>)
  // False

  io.debug(<<"Hello, Joe!":utf8>>)
  // UTF-8文字列のバイナリデータ
}
