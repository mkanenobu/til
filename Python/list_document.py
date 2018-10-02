list_test = [0, 2, 7, 'three', 34, 12]
print(list_test)
print(list_test[0]) #リストの最初の要素を返す
print(list_test[-1]) #リストの最後の要素を返す
list_test.append(6) #リストの最後に要素を追加
print(list_test)
list_test.insert(1, 'test') #(場所, 要素) 場所に要素を追加，もともとあったものは，ずれる
print(list_test)
list_test.pop(3) #その場所にある要素を削除する。削除された要素は戻り値として返ってくる
list_test.remove('test') #要素を直接指定して削除する。戻り値はない
list_test.remove('three')
list_test2 = [11, 20, 30]
list_test + list_test2 #リストの連結。リストの内容に変更はない
list_test.extend(list_test2) #リストの拡張。list_testにlist_test2の要素を追加
print(list_test)
print(list_test[0:3]) #スライス。0番目から3番目の一つ手前までの要素を返す
print(list_test[2:5]) #2番目から4番目まで
print(list_test[2:]) #2番目から最後まで
print(list_test[:3]) #最初から5番目の一つ前まで
list_test.sort() #リストの中身をソート，異なる型ではソート不可（エラー）
print(list_test)
list_test.reverse() #リストの中身の順序を逆に
print(list_test)
list_test.reverse() #元に
list_str = ["Documents", "Music", "Desktop", "Picture", "git"]
print(list_str)
list_str.sort() #文字列のリストでもソート可能
print(list_str)
