import terminal
var s:string = "Hello, World!"
#ForegroundColor = enum
#    fgBlack = 30,                 ## black
#    fgRed,                      ## red
#    fgGreen,                    ## green
#    fgYellow,                   ## yellow
#    fgBlue,                     ## blue
#    fgMagenta,                  ## magenta
#    fgCyan,                     ## cyan
#    fgWhite                     ## white
setForegroundColor(stdout,fgGreen)
echo s
setBackgroundColor(stdout,bgRed)
echo s

resetAttributes(stdout)
echo s
#styledWriteLine(stdout,styleDim,s)
setStyle({styleDim})
echo s
echo ""

setForegroundColor(stdout, fgRed)
echo s    # 赤色
setBackgroundColor(stdout, bgGreen)
echo s    # 背景色緑，文字色赤
resetAttributes(stdout)  # リセット
echo s
