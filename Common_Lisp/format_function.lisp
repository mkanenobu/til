; #!/usr/bin/sbcl --script
; 第一引数 destination: 出力先を指定する
; 明示的に出力ストリームを指定すると，そこに出力。
; tにすると標準出力、nilにすると出力せず返り値として返す。
; fill pointer付き文字列にするとその文字列に追加。
(format t "Hello~%")

(format t "Hello, ~S~%"(read))

