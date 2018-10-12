proc yes(question: string): string = "no"
discard yes("May I ask a question?")
# procを呼び出しつつ，その返り値を無視するにはdiscard文が必要


proc p(x, y: int): int {.discardable.} =
    return x + y

p(3, 4) # 今は可能

# 呼び出したprocやイテレータを宣言した際，discardableプラグマが使われていた場合，discarで明示せずに返り値を無視できる。

discard """discardはブロックコメントを作るときにも使える
        テスト
テスト"""

