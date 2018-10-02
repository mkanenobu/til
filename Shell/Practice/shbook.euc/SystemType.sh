
#
# File: SystemType.sh
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

SystemType() {
     #
     # 名称
     #    SystemType - そのシステムを判断する名称を出力する
     #
     # 書式
     #    SystemType
     #
     # 解説
     #    この関数はシステムのタイプを判別し、以下の
     #    いずれかの文字列を返す。
     #    
     #         FREEBSD   LINUX     AIX       DECOSF    HP
     #         SCO       SGI       SOLARIS   SUNBSD    ULTRIX
     #
     #    ULTRIX は DEC の古いタイプの BSD 系のシステムであり、
     #    DECOSF は OSF をベースにした DEC のシステム。
     #
     #    SUNBSD は SUN の BSD 系のもの（バージョンが 4.xx）であり、
     #    SOLARIS は SUN の System V 系（バージョンが 5.xx）。
     #
     #    システムが判別できなかった場合にはヌル文字を返す。
     #
     _HOSTNAME=`hostname | sed 's/\..*//'`

     case `uname -s` in
          FreeBSD )      echo FREEBSD             ;;
          Linux )        echo LINUX               ;;
          AIX )          echo AIX                 ;;
          HP-UX )        echo HP                  ;;
          IRIX )         echo SGI                 ;;
          OSF1 )         echo DECOSF              ;;
          ULTRIX )       echo ULTRIX              ;;
          SunOS )        case `uname -r` in
                              4*)  echo SUNBSD    ;;
                              5*)  echo SOLARIS   ;;
                         esac
                         ;;
          $_HOSTNAME )   case `uname -m` in
                              IP*)      echo SGI  ;;
                              i386)     echo SCO  ;;
                         esac
                         ;;
     esac
}
