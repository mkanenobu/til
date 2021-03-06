整数型の基本型
型名|データ長|値の範囲
----|----
shortint|符号付き8ビット|-128 ~ 127
smallint|符号付き16ビット|-32768 ~ 32767
longint|符号付き32ビット|-2147483648 ~ 2147483647
int64|符号付き64ビット|-2^63 ~ 2^(63 - 1)
byte|符号なし8ビット|0 ~ 255
word|符号なし16ビット|0 〜 65535
longword|符号なし32ビット|0 ~ 4294967295

整数型の汎用型
型名|データ長|値の範囲
----|----
integer|符号付き32ビット|-2147483648 ~ 2147483647
cardinal|符号なし32ビット|0 ~ 4294967295

実数型の基本型
型名|データ長|有効桁数|値の範囲
----|----
real48|48bit|11 ~ 12|2.9 \* 10^-39 ~ 1.7 \* 10^38
single|32bit|7 ~ 8|1.5 \* 10^-45 ~ 3.4 \* 10^38
double|64bit|15 ~ 16|5.0 \* 10^-324 ~ 1.7 \* 10^308
extended|80bit|19 ~ 20|3.6 \* 10^-4951 ~ 1.1 \* 10^4932
comp|64bit|19 ~ 20|-2^63 + 1 ~ 2^63 - 1
currency|64bit|19 ~ 20|-922337203685477.5808 ~ 922337203685477.5807

実数型の汎用型
型名|データ長|有効桁数|値の範囲
----|----
real|64bit|15 ~ 16|5.0 \* 10^-324 ~ 1.7 \* 10^308

文字型の基本型
型名|データ長|用途
----|----
ansiChar|8bit|1バイト文字(ANSI)
wideChar|16bit|複数バイトを使った文字(Unicode)

文字型の汎用型
型名|データ長|用途
----|----
char|8bit|AnsiCharと同じ

文字列型
型名|最大長|必要なメモリー|用途
----|----
shortString|255文字|2 ~ 256byte|下位互換性のため
ansiString|2^31文字まで|4 ~ 2Gbyte|1バイト文字(ANSI)
wideString|2^30文字まで|4 ~ 2Gbyte|複数バイトを使った文字(Unicode)

論理型
型名|データ長|用途
----|----
boolean|1byte|標準
byteBool|1byte|他の言語やOSのライブラリとの互換性のため
wordBool|2byte(1ワード)|同上
longBool|4byte(2ワード)|同上
