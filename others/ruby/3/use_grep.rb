require_relative "grep"   # grep.rbの読み込み(.rbは省略可)

pattern = Regexp.new(ARGV[0])
filename = ARGV[1]
simple_grep(pattern, filename) # simple_grepメソッドの起動
