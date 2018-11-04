#!/usr/bin/env python3
# -*- coding: utf-8 -*-
string = "こんにちは。こんばんわ。わんばんこ。"

arr = string.split("。")
arr2 = filter(lambda x: x != "", arr)
print(arr)
print(list(arr2))
