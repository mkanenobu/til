#!/usr/bin/env python3
# intの場合
number = 50
print('{0:04d}'.format(number))
padded_num = '%04d' % number
print(padded_num)

# strの場合
number = "50"
print(number.zfill(4))
