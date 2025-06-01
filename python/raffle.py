#!/usr/bin/env python
# -*- coding: utf-8 -*-

from fractions import Fraction
from collections import Counter
import random

# ラベルと確率の定義（合計は1以下にしてください）
probabilities = [
    ("1st Prize", Fraction(1, 10)), # 10%
    ("2nd Prize", Fraction(2, 10)), # 20%
    ("3rd Prize", Fraction(3, 10)), # 30%
]

# 合計が1を超えていないか検証
total_prob = sum(prob for _, prob in probabilities)
assert total_prob <= Fraction(1), "Total probability must not exceed 1."

# ハズレの確率を追加（残りの確率分）
if total_prob < Fraction(1):
    probabilities.append(("No Win", Fraction(1) - total_prob))

# 累積確率のリストを作成
thresholds = []
accum = Fraction(0)
for label, prob in probabilities:
    accum += prob
    thresholds.append((label, accum))

def draw():
    # 0.0000〜0.9999
    r = Fraction(random.randint(0, 9999), 10000)  
    for label, threshold in thresholds:
        if r < threshold:
            return label 
    raise RuntimeError(f"Invalid draw: random={float(r)}, max threshold={float(thresholds[-1][0])}")

def main():
    results = [draw() for _ in range(1000)]
    total_count = len(results)

    counter = Counter(results)

    print(f"Results ({total_count} draws):")
    for label, prob in probabilities:
        count = counter.get(label, 0)
        actual_ratio = count / total_count
        expected_ratio = float(prob)
        diff_ratio = actual_ratio - expected_ratio
        print(f"{label:<9}: {count:4d} ({actual_ratio:.2%}) "
            f"Expected: {expected_ratio:.2%} "
            f"Diff: {"+" if diff_ratio >= 0 else "-"}{abs(diff_ratio):.2%}")

if __name__ == "__main__":
    main()
