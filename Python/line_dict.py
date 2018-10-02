import re  #正規表現

dictionary = open("../../Documents/ejdic-hand-utf8.txt","rt",encoding="utf-8")

fw = open("q-list.txt","wt")

for line in dictionary:
    if re.match(r"q[a-z]{3}\s", line):
        fw.write(line)
        print(line.strip())

fw.close()
dictionary.close()
