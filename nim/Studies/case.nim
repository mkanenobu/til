let name = readLine(stdin)

case name
of "":
    echo "Input name"
of "name":
    echo "Very funny"
of "Dave", "Frank":
    echo "Cool name!"
else:
    echo "Hi, ", name, "!"
