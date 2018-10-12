const
    #pageSize = 4096
    pageSize = 8192
    yes = "y\n"
var buffer = ""

for i in 1..pageSize:
    buffer &= yes

while true:
    discard stdout.writeChars(buffer, 0, buffer.len)
