#include <stdio.h>

int main() {
    int a = 0;
    int b = 1;
    int c;
    int i;
    int input;
    // %d: int, %f: float, 
    scanf("%d", &input);
    if (input == 0) {
        printf("0\n");
    } else {
        for (i = 0; i < input; i++) {
            c = a + b;
            a = b;
            b = c;
        }
        printf("%d\n", b);
    }
    return 0;
}
