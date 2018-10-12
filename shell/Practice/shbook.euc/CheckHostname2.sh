
#
# ファイル名称: CheckHostname2.sh
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

CheckHostname2() {
     #
     # 名称
     #    CheckHostname2 - ホストが利用可能かどうかを判定する
     #
     # 書式
     #    CheckHostname2 [hostname]
     #
     # 解説
     #    指定したホストが利用可能であれば真（０）を返し、
     #    そうでなければ偽（０以外）を返す。
     #    ホスト名称を指定していない場合、現在使用中の
     #    ホスト名称をチェックする。
     #
     _PING=                   # ping コマンドを使い分ける
     _HOST=${1:-`hostname`}   # チェックするホスト名称

     case `uname -s` in
          FreeBSD ) _PING="ping -c1 $_HOST"  ;; # FreeBSD
          Linux )   _PING="ping -c1 $_HOST"  ;; # Linux
          OSF1 )    _PING="ping -c1 $_HOST"  ;; # DEC OSF
          HP-UX )   _PING="ping $_HOST 64 1" ;; # HP-UX
          IRIX )    _PING="ping -c1 $_HOST"  ;; # SGI
          SunOS )   _PING="ping $_HOST"      ;; # BSD and
                                                # Solaris
          * )       return 1                 ;;
     esac

     return $_PING >/dev/null 2>&1
}
