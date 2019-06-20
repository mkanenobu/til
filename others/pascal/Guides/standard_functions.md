### 標準的な関数

#### 整数型、実数型系
関数|説明|引数|返り値
----|----
abs|絶対値|real or integer|引数と同じ型
arctan|ラジアンでのアークタンジェント(arctan)|real or integer|real
cos|ラジアンでコサイン(cosine)|real or integer|real
exp|指数|real or integer|real
ln|自然対数|real or integer|real
round|最も近い整数への丸め|real|integer
sin|ラジアンでのサイン(sin)|real or integer|real
sqr|二乗(指数2)|real or integer|引数と同じ型
sqrt|平方根(指数1/2)|real or integer|real
trunc|端数の切り捨て|real or integer|integer

#### 整数型、文字型系
関数|説明|引数|返り値
----|----
chr|ASCII 値で表した文字|integer|char
ord|順序値|integer or char|integer
pred|前の値|integer or char|引数と同じ型
succ|後の値|integer or char|引数と同じ型

```:pascal
writeln(pred('b'))   -> a
writeln(succ('b'))   -> c
```
