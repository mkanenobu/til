#!/usr/bin/env ruby

module Eval
  def self.eval(exp)
    if !list?(exp)
      if immediate_val?(exp)
        exp
      else
        lookup_primitive_fun(exp)
      end
    else
      fun = self.eval(car(exp))
      args = eval_list(cdr(exp))
      apply(fun, args)
    end
  end

  def self.list?(exp)
    exp.is_a?(Array)
  end

  $primitive_fun_env = {
    :+ => [:prim, lambda { |x, y| x + y }],
    :- => [:prim, lambda { |x, y| x - y }],
    :* => [:prim, lambda { |x, y| x * y }],
  }

  def self.lookup_primitive_fun(exp)
    $primitive_fun_env[exp]
  end

  def self.car(list)
    list[0]
  end

  def self.cdr(list)
    list[1..-1]
  end

  def self.eval_list(exp)
    exp.map { |e| Eval.eval(e) }
  end

  def self.immediate_val?(exp)
    num?(exp)
  end

  def self.num?(exp)
    exp.is_a?(Numeric)
  end

  def self.apply(fun, args)
    apply_primitive_fun(fun, args)
  end

  def self.apply_primitive_fun(fun, args)
    fun_val = fun[1]
    fun_val.call(*args)
  end
end

puts Eval.eval([:+, 1, 2])
