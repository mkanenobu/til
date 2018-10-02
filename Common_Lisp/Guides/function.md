### 関数定義
関数を定義するにはdefunを使う。コードがリストになっていてオペレータ名 + 引数...の形式になっていることに注意。

```commonlisp
* (defun hello (name)
    (format t "hello, ~a!~%" name))
HELLO

* (hello "world")
hello, world!
```
