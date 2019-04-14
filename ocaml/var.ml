let n = 100;;

let print_n =
  (* lexical scope *)
  let n = 10 in
  Printf.printf "%d\n" n

let () =
  (* prints 10 *)
  print_n
