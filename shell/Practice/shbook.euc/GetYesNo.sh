
#
# File: GetYesNo.sh
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

GetYesNo() {
     #
     # 名称
     #    GetYesNo - 質問を出しそれに対する Yes か No の応えを取得する
     #
     # 書式
     #    GetYesNo "message"
     #
     # 解説
     #    あるメッセージを出力し、それに対しての応えとして
     #    Yes か No を要求する関数。
     #    Yes が応えられたら真（０）を返し、
     #    No であれば偽（１）を返す
     #    Yes でも No でもない場合にはどっちかを入力するよう
     #    に要求する。必ずどちらかの入力をしないと終了しない。
     #
     _ANSWER=            # ユーザが入力する応えを入れる変数

     if [ $# -eq 0 ]; then
          echo "Usage: GetYesNo message" 1>&2
          exit 1
     fi

     while :
     do
          if [ "`echo -n`" = "-n" ]; then
               echo "$@\c"
          else
               echo -n "$@"
          fi
          read _ANSWER
          case "$_ANSWER" in
               [yY] | yes | YES | Yes ) return 0       ;;
               [nN] | no  | NO  | No  ) return 1       ;;
               * ) echo "Please enter y or n."         ;;
          esac
     done
}
