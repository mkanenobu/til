
#
# File: Prompt.sh
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

Prompt() {
     #
     # 名称
     #    Prompt - 応答要求メッセージを出力する
     #
     # 書式
     #    Prompt [message]
     #
     # 解説
     #    指定したメッセージを、改行コードなしに標準出力へ書く関数。
     #
     #    メッセージを指定しなかった場合、
     #    「> 」というプロンプトを表示する。
     #
     if [ "`echo -n`" = "-n" ]; then
          echo "${@-> }\c"
     else
          echo -n "${@-> }"
     fi
}
