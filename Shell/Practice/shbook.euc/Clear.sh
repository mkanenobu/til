
#
# ファイル名称: Clear.sh
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

Clear() {
     #
     # 名称
     #    Clear - 端末画面をクリアする
     #
     # 書式
     #    Clear
     #
     # 解説
     #    clear コマンドか tput コマンドを使って端末画面を
     #    クリアする関数。もしどちらのコマンドも使えない
     #    ＯＳの場合、40 行の空白行を出力する。
     #
     { clear;       } 2>/dev/null  ||
     { tput clear;  } 2>/dev/null  ||
     for i in 1 2 3 4 5 6 7 8 9 10 \
              1 2 3 4 5 6 7 8 9 20 \
              1 2 3 4 5 6 7 8 9 30 \
              1 2 3 4 5 6 7 8 9 40
     do
          echo
     done
}
