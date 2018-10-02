#!/usr/bin/env python3
""" 引数1=現在のAP,引数2までの時間,引数2がなければ40の倍数"""
import sys
import time
import datetime

APOverflow = "現在，APの最大値は139です。"
AP_LIMIT = 139

def error():
    sys.exit(2)
    """ ここまで回復"""
count = 0
if len(sys.argv) > 3:
    error()
elif len(sys.argv) == 3:
    if int(sys.argv[1]) >= int(sys.argv[2]):
            error()
    count = int(sys.argv[2])
elif len(sys.argv) == 2:
    count = (int(sys.argv[1]) // 40 + 1) * 40
else:
    error()

if int(count) >= AP_LIMIT:
    error()

# 残り時間
leftMinute = (count - int(sys.argv[1])) * 5

hour = int(leftMinute / 60)
minute = leftMinute % 60

# 回復時刻
scheduledTimeUnix = int(time.time()) + (leftMinute * 60)
scheduledTime = datetime.datetime.fromtimestamp(scheduledTimeUnix).strftime("%H時%M分")

print("AP%sまで約%s時間%s分" % (count, hour, minute))
print(str(scheduledTime) + "までに回復予定")
