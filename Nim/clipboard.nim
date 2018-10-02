import sequtils,strutils,osproc,os
var
    # ls = "ls -l"
    copy2clip = "xclip -selection clipboard"
    s = "Hello,こんにちは"
#system.programResult = execShellCmd(ls)
## programResult = execShellCmd(cmd)
#echo execProcess(ls)

system.programResult = execShellCmd("xclip -selection clipboard" & " << EOS\n" & s)
system.programResult = execShellCmd(copy2clip & " << EOS\n" & s)
