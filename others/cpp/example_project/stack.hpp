#include <vector>

class Stack {
private:
    std::vector<int> stack = {};

public:
    void push(int n)
    {
        std::vector<int>::iterator end = stack.begin();
        stack.insert(end, n);
    }

    int size()
    {
        return stack.size();
    }

    bool empty()
    {
        return stack.empty();
    }

    int top()
    {
        bool empty = Stack::empty();
        if (!empty) {
            return stack.at(Stack::size());
        }
        return 0;
    }
};
