
#
# File: StrCmp.sh
#
# Copyright 1995, by Hewlett-Packard Company
#
# The code in this file is from the book "Shell Programming
# Examples" by Bruce Blinn, published by Prentice Hall.
# This file may be copied free of charge for personal,
# non-commercial use provided that this notice appears in
# all copies of the file.  There is no warranty, either
# expressed or implied, supplied with this code.
#
# このファイルのコードはBruce Blinn著、Prentice Hall刊行の
# 「Shell Programming Examples」に掲載されていたものです。
# このファイルは、個人として営利を目的とせず利用する限り、
# 無償で複製してかまいません。その場合、複製のすべてに
# この説明文が含まれている必要があります。このコードに
# 関しては、明示的にも暗黙的にもいかなる保証も行いません。
#

StrCmp() {
     #
     # 名称
     #    StrCmp - 二つの文字列を比較する
     #
     # 書式
     #    StrCmp string1 string2
     #
     # 解説
     #    二つの文字列を比較し、三つの結果を返す関数。
     #    前者と後者が等しければ 0、
     #    前者の方が後者より小さければ -1、
     #    前者の方が後者より大きければ 1 を返す（出力する）。
     #    
     #    比較は辞書的に行なう。数値 ＜ 大文字 ＜ 小文字 が基本だが
     #    12 と 2 では 12 の方が小さいことになる。
     #
     #    結果は標準出力に書き出し、終了コードにセットするものではない。
     #
     if [ $# -ne 2 ]; then
          echo "Usage: StrCmp string1 string2" 1>&2
          exit 1
     fi
     
     if [ "$1" = "$2" ]; then
          echo "0"
     else
          _TMP=`{ echo "$1"; echo "$2"; } | sort | sed -n '1p'`

          if [ "$_TMP" = "$1" ]; then
               echo "-1"
          else
               echo "1"
          fi
     fi
}
