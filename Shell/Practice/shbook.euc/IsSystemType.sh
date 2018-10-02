
#
# File: IsSystemType.sh
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

IsSystemType() {
     #
     # 名称
     #    IsSystemType - システムのタイプが正しいかどうかを判定する
     #
     # 書式
     #    IsSystemType string
     #
     # 解説
     #    指定した文字列が今動作しているシステムを表わすものかどうか
     #    を調べる関数。uname コマンドを使ってチェックし、
     #    合っていれば真（０）を返し合っていなければ偽（１）を返す。
     #
     if [ $# -ne 1 ]; then
          echo "Usage: IsSystemType string" 1>&2
          exit 1
     fi

     if [ "$1" = "`uname -s`" ]; then
          return 0
     elif [ "$1" = "`uname -m`" ]; then
          return 0
     else
          case `uname -r` in
               "$1"* ) return 0 ;;
          esac
     fi
     return 1
}
