import sys
#コマンドラインから受け取ったデータはsys.argvリストに入る
input_list = sys.argv[1:]
input_list.sort()
print(input_list)
