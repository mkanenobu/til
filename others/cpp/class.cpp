#include <iostream>
#include <string>
using namespace std;

class Neko {
  private: string name;

  public: Neko(string s) {
    name = s;
  }

  void naku(){
    cout << "にゃあ。俺様は"<< name <<"だ。" << endl;
  }
};

int main(){
  // タマという名前を持つdoraが生成される
  Neko dora("タマ");
  dora.naku();
}
