#!/usr/bin/env ruby

def f1(first_arg, *args)
  pp "first_arg is #{first_arg}"
  args.sum
end

pp f1(1, 2, 3, 4, 5)

def f2(**args)
  pp args
end

f2(arg1: 'hoge', arg2: 'huga')

def f3
  yield
  yield # Same
end

f3 { p 'hogehoge' }

def f4(arg1:, arg2: 4)
  pp arg1 / arg2
end

f4(arg1: 10, arg2: 3.0)
f4(arg2: 10, arg1: 3.0)
f4(arg1: 3.0)
