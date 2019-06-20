#include<stdio.h>

char* hello(void) {
	 return "Hello, World!";
}

int main(void) {
	 printf("%s", hello());
	 return 0;
}
