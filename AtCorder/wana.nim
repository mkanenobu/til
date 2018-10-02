var
    word: string = stdin.readLine
    rejectChar: set[char] = {'a','i','u','e','o'}
    ans: string = ""
for i in word:
    if not(i in rejectChar):
        ans.add(i)
echo ans
