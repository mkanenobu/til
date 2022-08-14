#include <iostream>

#include "stack.hpp"

int main(void)
{
    Stack stack;

    stack.push(3);
    std::cout << stack.top() << std::endl;
    return 0;
}
