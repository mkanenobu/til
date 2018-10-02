
#
# File: Question.sh
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

Question() {
     #
     # 名称
     #    Question - 応答を要求する
     #
     # 書式
     #    Question question default helpmessage
     #
     # 解説
     #    指定したメッセージを標準出力に書き出し、
     #    ユーザに応答を要求する関数。
     #    ユーザの入力した応答結果は ANSWER という変数に代入する。
     #
     #    ユーザは基本的にどういう文字列を入力してもよい
     #    （一応、ユーザの入力が yes か no かの場合は考慮している）。
     #    入力された文字列に対しての処理の実行は
     #    変数 ANSWER の値を判断して各シェルスクリプトで行なう。
     #    
     #    入力項目にデフォルト値を設定可能。
     #    この値を設定しておくと、問い合わせメッセージのあとに
     #    [ ]で括ってそれを出力する。
     #    ユーザは空エンタでこのデフォルト値を入力したことになる。
     #
     #    ヘルプメッセージも指定可能。
     #    ユーザが応答入力時に ? とタイプすれば、
     #    何を問うているのか、何を応えればどういう処理をするのかという
     #    メッセージを表示できる。
     #    ヘルプメッセージ出力後、再度応答要求メッセージを出力する。
     #
     #    デフォルトの応答とヘルプメッセージは、設定しない場合には
     #    "" という空の文字列を引数に指定しなくてはならない。
     #
     #    ユーザは応答入力時に q とタイプすることで
     #    シェルスクリプトを終了することが可能。
     #
     #    応答入力時に、! を付けて普通のコマンドを実行可能。
     #    コマンドを実行し結果を確認してから入力できるようにしたもの。
     #    コマンドの実行後、再度応答要求メッセージを出力する。
     #
     #    デバッグモードを用意している。
     #    応答入力時に -x、+x でデバッグモードのオンオフを切り替える。
     #
     if [ $# -lt 3 ]; then
          echo "Usage: Question question" \
               "default helpmessage" 1>&2
          exit 1
     fi
     ANSWER=             # ユーザの入力データを代入する変数
     _DEFAULT=$2         # デフォルトの値をセット
     _QUESTION=          # 入力要求メッセージを代入する変数
     _HELPMSG=$3         # ヘルプメッセージを代入する変数

     if [ "$_DEFAULT" = "" ]; then
          _QUESTION="$1? "
     else
          _QUESTION="$1 [$_DEFAULT]? "
     fi

     while :
     do
          if [ "`echo -n`" = "-n" ]; then
               echo "$_QUESTION\c"
          else
               echo -n "$_QUESTION"
          fi
          read ANSWER
          case `echo "$ANSWER" | tr [A-Z] [a-z]` in
               "" ) if [ "$_DEFAULT" != "" ]; then
                         ANSWER=$_DEFAULT
                         break
                    fi
                    ;;

          yes | y ) ANSWER=yes
                    break
                    ;;

           no | n ) ANSWER=no
                    break
                    ;;

         quit | q ) exit 1
                    ;;

          +x | -x ) set $ANSWER
                    ;;

               !* ) eval `expr "$ANSWER" : "!\(.*\)"`
                    ;;

              "?" ) echo ""
                    if [ "$_HELPMSG" = "" ]; then
                         echo "No help available."
                    else
                         echo "$_HELPMSG"
                    fi
                    echo ""
                    ;;

               * )  break
                    ;;
          esac
     done
}
