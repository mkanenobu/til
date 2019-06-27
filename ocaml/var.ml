open Printf
let n = 100;;

let print_n =
  (* lexical scope *)
  let n = 10 in
  Printf.printf "%d\n" n

let mutabletable_var = ref 0

let () =
  (* prints 10 *)
  print_n;
  (* prints 100 *)
  printf "%d\n" n;

  (* `!` access ref var *)
  printf "%d\n" !mutabletable_var;
  mutabletable_var := 5;
  printf "%d\n" !mutabletable_var;

