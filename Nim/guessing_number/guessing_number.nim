import random, strutils

proc guessing_num() =
    randomize()
    var secret_num = random(max=101)
    echo "数を予想してください"
    echo "予想した数を入力してください"
    while true:
        var guess: int = stdin.readLine.parseInt
        if guess == secret_num:
            echo "当たりです"
            break
        elif guess > secret_num:
            echo "大きすぎます"
        elif guess < secret_num:
            echo "小さすぎます"

guessing_num()
