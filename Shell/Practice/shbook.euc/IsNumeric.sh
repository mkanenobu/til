
#
# File: IsNumeric.sh
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

IsNumeric() {
     #
     # 名称
     #    IsNumeric - 文字列が数値かどうかを判定する
     #
     # 書式
     #    IsNumeric string
     #
     # 解説
     #    指定した文字列がすべて数値からなるものであれば真（０）を返す。
     #    何か数値以外の文字が含まれていた場合には偽（１）を返す。
     #    
     if [ $# -ne 1 ]; then
          return 1
     fi

     expr "$1" + 1 >/dev/null 2>&1
     if [ $? -ge 2 ]; then
          return 1
     fi

     return 0
}
