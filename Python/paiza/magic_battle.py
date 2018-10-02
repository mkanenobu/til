#!/usr/bin/env python3
# coding: utf-8
import numpy as np
import math
n, m, mp = map(int, input().split())
enemies = []
single = []
all_ = []
res = []
for i in range(0, n):
    enemies.append(int(input()))

for j in range(0, m):
    t, damage, cost = input().split()
    if t == "single":
        single.append([damage, cost])
    elif t == "all":
        all_.append([damage, cost])

while True:
    cost_per_enemy_all = []
    for i in range(0, len(all_)):
        cost_per_enemy_all.append((all_[i][0] * n) / all_[i][1])

    cost_per_enemy_single = []
    for i in range(0, len(all_)):
        cost_per_enemy_single.append((single[i][0] * n) / single[i][1])

    if len(cost_per_enemy_all) != 0:
        if min(cost_per_enemy_all) <= min(cost_per_enemy_single):
            minimum_energy = np.argmin(cost_per_enemy_all)
            times = math.ceil(min(enemies) / all_[minimum_energy][0])
            mp -= times * all_[minimum_energy][1]
            if mp > 0:  # 全体では一体も倒せない
                break
            enemies.map(lambda n: n - (times * all_[minimum_energy][1]))
            enemies.filter(lambda n: n <= 0)
        else:
            minimum_energy = np.argmin(cost_per_enemy_single)
            times = math.ceil(min(enemies) / single[minimum_energy][0])
            mp -= times * single[minimum_energy][1]
            enemies.map(lambda n: n - (times * single[minimum_energy][1]))
            enemies.filter(lambda n: n <= 0)

    if mp < 0:
        print(n - len(enemies))
        break

