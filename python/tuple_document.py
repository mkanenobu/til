# タプルは要素の追加や削除ができないリスト

tuple_test = (1,2,3,"100yen") #タプルは丸括弧で作る
print(tuple_test)
print(tuple_test[3]) #中身を参照することはできる
print(tuple_test[0:3])

tuple_one = (1,) #要素がひとつのタプルを作るときは最後にカンマをつける。(無ければただの整数になる)
list_test = list(tuple_test) #タプルからリストを作る
print(list_test)
list_test.append("new")
print(list_test)
