#!/usr/bin/env python3
import sys
import subprocess
# subprocess.call(['ls', '-a'])  # 成功すれば返り値は1
# subprocess.run(['ls', '-a'])  # コマンドの結果が返り値

# 出力を得る
res = subprocess.run(['ls', '-a'], stdout=subprocess.PIPE)
# sys.stdout.buffer.write(res.stdout)
print(res)
