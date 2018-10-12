#!/usr/bin/env lua

-- 外部コマンドの結果を受け取る
local command = "ls ~/Downloads"

local handle = io.popen(command)
local result = handle:read("*a")
handle:close()

print(result)

-- 終了コード付き
--print(os.execute(command))
