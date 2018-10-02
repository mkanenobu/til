let
    atcorder: set[char] = {'a','t','c','o','d','e','r'}
    win = "You can win"
    lose = "You will lose"
proc tramp(line1, line2: string): string =
    for i in 0..line1.len:
        if (line1[i] == '@' and line2[i] in atcorder) or (line2[i] == '@' and line1[i] in atcorder):
            discard
        elif line1[i] == line2[i]:
            discard
        else:
            return lose
    return win

echo tramp(stdin.readLine, stdin.readLine)
