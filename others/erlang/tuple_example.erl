#!/usr/bin/env escript
-module(tuple_example).
-export([main/1]).

main(Args) ->
  T1 = {apple, orange, peach},
  io:format("~p\n", Args),
  Str = io_lib:format("~p\n", [T1]),
  io:format(Str).