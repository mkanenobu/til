import strutils
let s = "http://www.google.com/seqrch?q=%s"
echo(s.replace("%s", "hogehoge"))
