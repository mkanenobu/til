# keyとvalueをペアで保存し，キーを使って値を呼び出す
country_code = {1:"America", 39:"Italia", 86:"China"}
print(country_code)
print(country_code[39]) #keyで呼び出す
print(81 in country_code) #そのkeyの値が存在するか確認，TrueかFalseで返ってくる(bool型)
print(39 in country_code)
country_code[81] = "Japan" #要素の追加
print(country_code)
country_code[81] = "Nihon" #重複するキーに代入すれば値を変更できる
print(country_code)
print(country_code.pop(81)) #値を削除

new_dict = {} #新しい辞書を作成しキーと値のペアを追加
new_dict['apple'] = 100
new_dict['orange'] = 140
print(new_dict)
