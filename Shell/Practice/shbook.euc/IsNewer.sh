
#
# File: IsNewer.sh
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

IsNewer() {
     #
     # 名称
     #    IsNewer - 二つのファイルの日付を比べる
     #
     # 書式
     #    IsNewer file1 file2
     #
     # 解説
     #    file2 の日付よりも file1 の日付の方が新しい（最近のもの）
     #    ならば真（０）を返し、そうでなければ偽（１）を返す関数。
     #    日付というのはそのファイルの最終更新時刻をいう。
     #    
     if [ $# -ne 2 ]; then
          echo "Usage: IsNewer file1 file2" 1>&2
          exit 1
     fi

     if [ ! -f $1 -o ! -f $2 ]; then
          return 1       # 指定されたものがファイルじゃなかった場合
     fi

     if [ -n "`find $1 -newer $2 -print`" ]; then
          return 0       # 新しい
     else
          return 1       # 新しくない
     fi
}
