# セットは単純なデータの集まり。順番も値を呼び出すキーもない。
# 大きな特徴の一つとして同じものが2つ以上入らない
test_set = set()
print(test_set)
test_set.add(1) #セットに要素を追加するにはaddメソッドを使う
test_set.add(2)
test_set.add(3)
print(test_set)
print(1 in test_set) #inを使って値がセットに入っているか確認できる
print(10 in test_set)
test_set.remove(3) #removeを使ってセット内の要素を削除する
print(test_set)

list_test = [1, 2, 3, 4]
print(list_test)
from_list = set(list_test) #組み込み関数setを使うとリストからセットを作ることができる
print(from_list)
