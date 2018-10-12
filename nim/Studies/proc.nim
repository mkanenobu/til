proc yes(question: string): bool =
    echo question, " (y/N)"
    while true:
        case readLine(stdin)
        of "y", "Y", "yes", "Yes": return true
        of "n", "N", "no", "No": return false
        else: echo "Please be clear: yes or no"


if yes("Input"):
    echo "You enter Yes"
else:
    echo "You enter No"

# return文があるとprocから抜ける。(従ってwhileからも抜ける)
# (question: string): bool とはquestionというstring型のパラメータがあり，bool値を返すことを示す

# 返り値を返すprocでは，返り値を表すresultが暗黙に宣言されている
# 式があとに続いていないreturn文はreturn resultの省略形である
# 出口のreturnが存在しないprocは，終わる際に必ず，自動的にresultの値を返す
proc sumTillNegative(x: varargs[int]): int =
    for i in x: # xをひとつずつiに代入
        if i < 0: # i<0のときreturnで終了
            return # resultを返す
        result = result + i # i>=0のとき，この処理

echo sumTillNegative() # 0を出力
echo sumTillNegative(3,4,5) # 12を出力
echo sumTillNegative(3,4,-1,6) # 7を出力

