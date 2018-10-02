#include <iostream>
#include <string>
using namespace std;

class test{
private:
    string str;
public:
    test(string s){
        str = s;
    }
    void echo(){
        cout << "Hello, " << str << endl;
    }
};

int main(){
    string input;
    cin >> input;

    // クラス名 変数(引数);
    test hw("World");

    hw.echo();

    cout << input << endl;
}
