
#
# File: FullName.sh
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

FullName() {
     #
     # 名称
     #    FullName - ファイルやディレクトリの完全パス名を返す
     #
     # 書式
     #    FullName filename | directory
     #
     # 解説
     #    指定されたファイルやディレクトリを完全パス名で
     #    で表現したものを返す関数。 
     #    完全パス名とは / で始まるファイルやディレクトリの名称表示のこと。
     #    結果は標準出力に表示する。
     #    指定したファイルやディレクトリが存在しなかったら、
     #    そのまま何もせずにもとの名前を表示する。
     #    
     _CWD=`pwd`          # 現在の作業ディレクトリを覚えさせる

     if [ $# -ne 1 ]; then
          echo "Usage: FullName filename | directory" 1>&2
          exit 1
     fi

     if [ -d $1 ]; then
          cd $1
          echo `pwd`
     elif [ -f $1 ]; then
          cd `dirname $1`
          echo `pwd`/`basename $1`
     else
          echo $1
     fi

     cd $_CWD            # もとの作業ディレクトリに戻る
}
