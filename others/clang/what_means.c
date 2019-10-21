#include<stdio.h>

int main(void) {
	 int a = 7;
	 a /*= 3; // a を3で割って3をかける
	 a */= 6; // a に6を掛けて6で割る
	 printf("%d\n", a); // 6が出力される
	 return 0;
}
