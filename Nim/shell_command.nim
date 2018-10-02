import os,osproc

const command = """ls -a"""
#proc ls_test():string =
#    return execProcess(command)
#echo ls_test()
# コマンドの出力がそのまま返り値, osproc
var s = execProcess(command)
# コマンドの結果が返り値, os
var i = execShellCmd(command)
echo execShellCmd("top")
echo s
echo i
