import dom
# コンパイルエラー
proc createWindow(x = 0, y = 0, width = 500, height = 700,
title = "unknown", show = true): Window =
    discard


var w = createWindow(title = "My Application", height = 600, width = 800)

