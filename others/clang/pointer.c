#include<stdio.h>

int main() {
	int a = 123;
	// address operater `&`
	int* pointer_address = &a;
	printf("a's pointer address is %p\n", pointer_address);
	printf("a is %d\n", a);

	// pointer operater `*`
	*pointer_address = 321;
	printf("a is %d\n", a);
	return 0;
}
